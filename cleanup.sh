#!/bin/bash

# Check directories for if they exist, create them if they don't

for foldername in "images" "documents" "pdfs" "executables" "data" "unknown"; do
	if [[ -d "$foldername" ]]; then
		echo "Directory $foldername already exists. Skipping creation."
	else
		mkdir "$foldername"
	fi
done

# Initialize counters
image_count=0
document_count=0
pdf_count=0
executable_count=0
data_count=0
unknown_count=0
image_size=0
document_size=0
pdf_size=0
executable_size=0
data_size=0
unknown_size=0

# Move files 
echo "Moving files into their respective directories..."
for file in *; do
    if [[ -f "$file" && "$file" != "cleanup.sh" ]]; then
        case "$file" in
            *.jpg|*.jpeg|*.png|*.gif)
                mv "$file" images/
                ((image_count++))
                image_size=$((image_size + $(stat -c "%s" "images/$file")))
                ;;
            *.txt|*.docx|*.doc|*.pages|*.key|*.pptx|*.ppt|*.odt|*.md)
                mv "$file" documents/
                ((document_count++))
                document_size=$((document_size + $(stat -c "%s" "documents/$file")))
                ;;
            *.pdf)
                mv "$file" pdfs/
                ((pdf_count++))
                pdf_size=$((pdf_size + $(stat -c "%s" "pdfs/$file")))
                ;;
            *.sh|*.exe)
                mv "$file" executables/
                ((executable_count++))
                executable_size=$((executable_size + $(stat -c "%s" "executables/$file")))
                ;;
            *.csv|*.xlsx|*.json)
                mv "$file" data/
                ((data_count++))
                data_size=$((data_size + $(stat -c "%s" "data/$file")))
                ;;
            *)
                mv "$file" unknown/
                ((unknown_count++))
                unknown_size=$((unknown_size + $(stat -c "%s" "unknown/$file")))
                ;;
        esac
    fi
done

# Calculate average sizes
image_avg_size=$((image_size / (image_count)))
document_avg_size=$((document_size / (document_count)))
pdf_avg_size=$((pdf_size / (pdf_count)))
executable_avg_size=$((executable_size / (executable_count)))
data_avg_size=$((data_size / (data_count)))
unknown_avg_size=$((unknown_size / (unknown_count)))
total_size=$((image_size + document_size + pdf_size + executable_size + data_size + unknown_size))
total_count=$((image_count + document_count + pdf_count + executable_count + data_count + unknown_count))
total_average=$((total_size / total_count))

# Display results
echo "File move complete. Total files moved: $total_count"
echo "Total size of files moved: $total_size B"
echo "Average file size: $total_average B"
echo "*** Breakdown per file type ***"
echo "*** Images ***"
echo "Total moved: $image_count , total size $image_size B"
echo "Average file size: $image_avg_size B"
echo "*** documents ***"
echo "Total moved: $document_count , total size $document_size B"
echo "Average file size: $document_avg_size B"
echo "*** PDFs ***"
echo "Total moved: $pdf_count , total size $pdf_size B"
echo "Average file size: $pdf_avg_size B"
echo "*** Executables ***"
echo "Total moved: $executable_count , total size $executable_size B"
echo "Average file size: $executable_avg_size B"
echo "*** Data ***"
echo "Total moved: $data_count , total size $data_size B"
echo "Average file size: $data_avg_size B"
echo "*** Unknown ***"
echo "Total moved: $unknown_count , total size $unknown_size B"
echo "Average file size: $unknown_avg_size B"



