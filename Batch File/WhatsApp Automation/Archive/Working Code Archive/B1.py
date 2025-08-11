import pywhatkit as kit
import time

print("=" * 28)
print("Running WhatsApp Message Automation")
print("=" * 28)

# 🔹 Read phone numbers from file (only digits, trim whitespace)
with open("phonenumber.txt", "r", encoding="utf-8") as file:
    raw_numbers = [line.strip() for line in file if line.strip().isdigit()]

# 🔹 Read message from file with UTF-8 encoding
with open("message.txt", "r", encoding="utf-8") as file:
    message = file.read().strip()

# 🔹 Loop through each number and send the message
for raw_number in raw_numbers:
    phone_number = f"+91{raw_number}"
    print(f"📨 Sending to {phone_number}...")
    try:
        kit.sendwhatmsg_instantly(phone_number, message, wait_time=15, tab_close=True)
        time.sleep(10)  # Delay to avoid session issues
    except Exception as e:
        print(f"❌ Failed to send to {phone_number}: {e}")

print("-" * 28)
print("✅ All messages processed.")
print("-" * 28)