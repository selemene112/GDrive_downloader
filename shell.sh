#!/bin/bash

# Baca file image.base64 baris per baris
while IFS= read -r data_uri; do
    # Ambil bagian data Base64 dari URL data URI
    base64_data=$(echo "$data_uri" | sed -E 's/^data:image\/.*;base64,//')
    
    # Generate nama file unik berdasarkan waktu
    timestamp=$(date +%s%N)
    filename="output_${timestamp}.png"
    
    # Dekode dan simpan gambar
    echo "$base64_data" | base64 -d > "$filename"
    echo "File $filename berhasil dibuat."
done < Document.base64