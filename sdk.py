from dotenv import load_dotenv
import os
from azure.core.credentials import AzureKeyCredential
from azure.ai.textanalytics import TextAnalyticsClient

def main():
    global ai_endpoint
    global ai_key
    try:
        # Load environment variables
        load_dotenv()
        ai_endpoint = os.getenv('AI_SERVICE_ENDPOINT')
        ai_key = os.getenv('AI_SERVICE_KEY')

        # Check if credentials are loaded
        if not ai_endpoint or not ai_key:
            print("Error: AI_SERVICE_ENDPOINT or AI_SERVICE_KEY is not set.")
            return

        # Get user input until they enter "quit"
        userText = ''
        while userText.lower() != 'quit':
            userText = input('\nEnter some text ("quit" to stop):\n')
            if userText.lower() != 'quit':
                language = GetLanguage(userText)
                print('Language:', language)

    except Exception as ex:
        print(f"An error occurred: {ex}")

def GetLanguage(text):
    # Create client using endpoint and key
    credential = AzureKeyCredential(ai_key)
    client = TextAnalyticsClient(endpoint=ai_endpoint, credential=credential)

    # Call the service to get the detected language
    response = client.detect_language(documents=[text])
    detectedLanguage = response[0]  # Get the first result

    return detectedLanguage.primary_language.name if detectedLanguage.primary_language else "Unknown"

if _name_ == "_main_":
    main()