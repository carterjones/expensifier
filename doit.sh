#!/bin/bash

# Create temporary directories.
mkdir -p final
mkdir -p intermediate

# Extract the first page of the Cox bill.
pdftk ~/Downloads/PdfBillingStatement.pdf cat 1 output intermediate/cox-broken.pdf

# Extract the first 4 pages of the Verizon bill.
pdftk ~/Downloads/Verizon_bill_*          cat 1-4 output final/verizon.pdf

# Remove the Cox pin.
pdftk intermediate/cox-broken.pdf background cox-watermark.pdf output intermediate/cox-with-watermark.pdf
convert -quality 100 -density 300 intermediate/cox-with-watermark.pdf intermediate/cox-fixed.png
convert intermediate/cox-fixed.png final/cox.pdf

# Move the final PDFs to the ~/Downloads directory.
mv final/* $HOME/Downloads/

# Clean up PDFs.
rm -rf final
rm -rf intermediate

# Draft the email.
osascript create-email.applescript
