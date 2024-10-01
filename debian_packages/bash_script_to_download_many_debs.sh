urls=(
    # gstreamer_depends_urls
    "http://launchpadlibrarian.net/601697838/libpcre3-dev_8.39-13ubuntu0.22.04.1_arm64.deb"
    "http://launchpadlibrarian.net/601697841/libpcre3_8.39-13ubuntu0.22.04.1_arm64.deb"
)

# Directory to extract packages
extract_dir="/tmp/debian_packages_dir"

# System library directory (adjust as needed)
lib_dir="/usr/lib/aarch64-linux-gnu"

# Create extraction directory
mkdir -p $extract_dir

# Download, extract, and copy libraries
for url in "${urls[@]}"; do
    # Get the package name from the URL
    package_name=$(basename "$url")

    # Define retry count and success flag
    retry_count=0
    max_retries=5
    success=0

    # Try downloading the package with retries
    while [[ $retry_count -lt $max_retries ]]; do
        echo "Attempting to download $url (Attempt $((retry_count+1))/$max_retries)"

        # Download the package
        wget "$url" -P "$extract_dir/"

        # Check if wget succeeded
        if [[ $? -eq 0 ]]; then
            echo "Download succeeded!"
            success=1
            break
        else
            echo "Download failed. Retrying..."
            retry_count=$((retry_count+1))
        fi
    done

    # If the download failed after max retries, exit or skip
    if [[ $success -eq 0 ]]; then
        echo "Failed to download $url after $max_retries attempts. Skipping..."
        continue
    fi

    # Extract the package
    echo "Extracting $package_name"
    dpkg -x "$extract_dir/$package_name" "$extract_dir"
done

sudo cp -r $extract_dir/usr/lib/aarch64-linux-gnu/* $lib_dir/
sudo cp -r $extract_dir/usr/lib/*so* $lib_dir/
sudo cp -r $extract_dir/lib/aarch64-linux-gnu/* $lib_dir/