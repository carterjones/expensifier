# overview

I use this repo to automatically send monthly bills to Expensify after extracting the relevant pages and removing sensitive information (for me, my Cox account pin). Doing this manually takes me about 30 minutes. When automated using this repo, this takes me about 3 minutes.

To make use of this, you'll need to modify this repo to meet your needs. I wrote this for myself and am sharing it so others can adapt it to meet their needs.

# requirements

## software requirements

`pdftk`: https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk_server-2.02-mac_osx-10.11-setup.pkg

`convert`:

```
brew install imagemagick ghostscript
```

## configure scripts

Replace `shad0w` with your username in `create-email.applescript`.

# to be automated

## verizon

Get the 2nd of the month.

```
https://myvpostpay.verizonwireless.com/ui/bill/data/ao/printPdf?stmtDate=September+02,+2018
```

## cox

Get the 27th and 28th of each month. One will error, but the other should exist.

```
July:
https://www.cox.com/ibill/PdfBillingStatement.stmt?account13=7601056509801&stmtCode=001&cycleDate=7/27/2018&redirectURL=error.cox

August:
https://www.cox.com/ibill/PdfBillingStatement.stmt?account13=7601056509801&stmtCode=001&cycleDate=8/28/2018&redirectURL=error.cox
```

# already automated

## extract the first page

```
pdftk PdfBillingStatement.pdf cat 1 output cox-broken.pdf
pdftk ./Verizon_bill_*        cat 1 output verizon.pdf
```

## remove the cox pin

```
pdftk cox-broken.pdf background cox-watermark.pdf output cox-with-watermark.pdf
convert -quality 100 -density 300 cox-with-watermark.pdf cox-fixed.png
convert cox-fixed.png cox.pdf
```

# configure expensify

Add a secondary login using your personal email address so you can send from your personal email.

# set up email

Set up Mail.app using the email account used as the secondary login for expensify.

This way, you can submit expenses from my personal email account from a Mac.
