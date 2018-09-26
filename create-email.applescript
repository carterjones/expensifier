tell application "Mail"
        set recipientName to "receipts@expensify.com"
        set recipientAddress to "receipts@expensify.com"
        set theSubject to "monthly remote expenses"
        set coxFile to "Macintosh HD:Users:shad0w:Downloads:cox.pdf"
        set vznFile to "Macintosh HD:Users:shad0w:Downloads:verizon.pdf"

        ## Create the message.
        set theMessage to make new outgoing message with properties {subject:theSubject, visible:true}
        tell theMessage
                make new to recipient with properties {name:recipientName, address:recipientAddress}
                make new attachment with properties {file name:coxFile as alias}
                make new attachment with properties {file name:vznFile as alias}

                ##Send the Message
                #send

        end tell

        activate
end tell
