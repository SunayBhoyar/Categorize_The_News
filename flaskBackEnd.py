from flask import Flask, request 
import requests
app = Flask("__name__")
@app.route("/res",methods = ['GET'])
def func():
    Query = str(request.args['Query'])
    # Query2 = str(request.args['Query2'])
    return (requests.post("https://api.ai21.com/studio/v1/j1-large/complete",
    headers={"Authorization": "Bearer <<API HERE>>"},
    json={
        "prompt": "Classify the following news article into one of the following topics:\n1. World\n2. Sports\n3. Business\n4. Science and Technology\nTitle:\nAstronomers Observe Collision of Galaxies, Formation of Larger\nSummary:\nAn international team of astronomers has obtained the clearest images yet of the merger of two distant clusters of galaxies, calling it one of the most powerful cosmic events ever witnessed.\nThe topic of this article is:\nScience and Technology\n\n===\n\nClassify the following news article into one of the following topics:\n1. World\n2. Sports\n3. Business\n4. Science and Technology\nTitle:\nBomb Explodes Near U.S. Military Convoy (AP)\nSummary:\nAP - A car bomb exploded early Sunday near a U.S. military convoy on the road leading to Baghdad's airport, Iraqi police said, and a witness said two Humvees were destroyed.\nThe topic of this article is:\nWorld\n\n===\n\nClassify the following news article into one of the following topics:\n1. World\n2. Sports\n3. Business\n4. Science and Technology\nTitle:\nMaradona goes to Cuba\nSummary:\nThe former Argentine football star, Diego Armando Maradona, traveled on Monday to Cuba to continue his treatment against his addiction to drugs.\nThe topic of this article is:\nSports\n\n===\n\nClassify the following news article into one of the following topics:\n1. World\n2. Sports\n3. Business\n4. Science and Technology\nTitle:\n"+Query+"\nSummary:\n"+Query+"\nThe topic of this article is:",
        "numResults": 1,
        "maxTokens": 10,
        "temperature": 0,
        "topKReturn": 0,
        "topP":1,
        "countPenalty": {
            "scale": 0,
            "applyToNumbers": False,
            "applyToPunctuations": False,
            "applyToStopwords": False,
            "applyToWhitespaces": False,
            "applyToEmojis": False
        },
        "frequencyPenalty": {
            "scale": 0,
            "applyToNumbers": False,
            "applyToPunctuations": False,
            "applyToStopwords": False,
            "applyToWhitespaces": False,
            "applyToEmojis": False
        },
        "presencePenalty": {
            "scale": 0,
            "applyToNumbers": False,
            "applyToPunctuations": False,
            "applyToStopwords": False,
            "applyToWhitespaces": False,
            "applyToEmojis": False
      },
      "stopSequences":["==="]
    }
)).json()

if __name__ == "__main__":
    app.run()    

