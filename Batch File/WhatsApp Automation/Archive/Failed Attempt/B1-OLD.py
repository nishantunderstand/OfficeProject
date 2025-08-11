import pywhatkit as kit
import time
import csv
import os

print("=" * 40)
print("🚀 WhatsApp Message Automation (CSV Mode)")
print("=" * 40)

# 🔹 Check if CSV file exists
csv_file = "WhatsAppAutomation.csv"
if not os.path.exists(csv_file):
    print(f"❌ Error: '{csv_file}' not found in the current directory.")
    exit()

# 🔹 Read and send messages
try:
    with open(csv_file, mode='r', encoding='utf-8') as file:
        reader = csv.DictReader(file)
        rows = list(reader)

    print(f"📄 Loaded {len(rows)} contact(s). Starting to send messages...\n")

    for idx, row in enumerate(rows, start=1):
        phone_raw = row.get("PhoneNumber", "").strip()
        message = row.get("Message", "").strip()

        # Skip if no phone number
        if not phone_raw:
            print(f"⚠️  Row {idx}: Empty phone number — skipped.")
            continue

        # Format phone number with +91 (India); change if needed
        if phone_raw.startswith("0") or phone_raw.isdigit():
            phone_number = f"+91{phone_raw.lstrip('0')}"
        elif not phone_raw.startswith("+"):
            phone_number = f"+91{phone_raw}"
        else:
            phone_number = phone_raw

        print(f"📤 Sending to {phone_number}...")

        try:
            # 🔺 Increased wait_time and close_time for stability
            kit.sendwhatmsg_instantly(
                phone_no=phone_number,
                message=message,
                wait_time=30,        # Increased from 15 → 30 seconds
                tab_close=True,
                close_time=15         # Increased from 3 → 15 seconds
            )
            print(f"✅ Sent successfully to {phone_number}\n")

            # 🔽 Extra delay between messages to prevent issues
            time.sleep(15)  # Increased from 12 → 15 seconds

        except Exception as e:
            print(f"❌ Failed to send to {phone_number}: {str(e)}\n")

except Exception as e:
    print(f"❌ An error occurred: {e}")

print("=" * 40)
print("✅ All messages processed. Automation complete.")
print("=" * 40)