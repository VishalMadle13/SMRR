import vonage
client = vonage.Client(key="", secret="")
sms = vonage.Sms(client)



class SendMessage():
    def send(to,text ):
        responseData = sms.send_message(
            {
                "from": "Vonage APIs",
                "to":"91"+to,
                "text": text,
            }
        )
        if responseData["messages"][0]["status"] == "0":
            return 1
        else:
            return 0

# SendMessage.send("7875264278","hii")

#  print("Message sent successfully.")                                                 1
#  print(f"Message failed with error: {responseData['messages'][0]['error-text']}")    0



