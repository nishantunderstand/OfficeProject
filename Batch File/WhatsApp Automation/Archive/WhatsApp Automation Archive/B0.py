import pywhatkit as kit
import time

# List of raw 10-digit numbers
raw_numbers = ["9311834004", "9711688154", "9934423413"]

# Message to send
message = "Hello! How are you ???."

# Loop through each number and send the message
for raw_number in raw_numbers:
    phone_number = f"+91{raw_number}"
    print(f"Sending to {phone_number}...")
    kit.sendwhatmsg_instantly(phone_number, message, wait_time=15, tab_close=True)
    time.sleep(10)  # Delay between messages to avoid overlapping sessions

print("All messages sent successfully.")
