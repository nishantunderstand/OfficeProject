import pywhatkit as kit
import time

print("=" * 28)
print("Running WhatsApp Message Automation")
print("=" * 28)

# 🔹 Define the phone number (with country code)
phone_number = "+918318936098"

# 🔹 Read message from Motivation.txt file
with open("Motivation.txt", "r", encoding="utf-8") as file:
    message = file.read().strip()

# 🔹 Send the message instantly
try:
    print(f"📨 Sending to {phone_number}...")
    kit.sendwhatmsg_instantly(phone_number, message, wait_time=40, tab_close=True)
    time.sleep(20)  # Short pause to ensure message is sent
    print("✅ Message sent successfully.")
except Exception as e:
    print(f"❌ Failed to send: {e}")

print("-" * 28)
print("✅ Process completed.")
print("-" * 28)
