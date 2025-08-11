import pywhatkit as kit
import time
import os

# Set your working directory
base_path = r"C:\Users\User\Desktop\Batch File\WhatsApp Automation"
os.chdir(base_path)

# Load phone numbers
with open("phonenumber.txt", "r") as f:
    raw_numbers = [line.strip() for line in f if line.strip().isdigit()]

# Load message
with open("message.txt", "r") as f:
    message = f.read().strip()

# Find all image files (jpg, jpeg, png, bmp)
supported_extensions = (".jpg", ".jpeg", ".png", ".bmp")
image_files = []

for filename in os.listdir(base_path):
    if filename.lower().endswith(supported_extensions):
        full_path = os.path.join(base_path, filename)
        image_files.append(full_path)

if image_files:
    print("📷 Found images to send:")
    for img in image_files:
        print("  -", img)
else:
    print("⚠️ No images found — only text will be sent.")

# Send messages
for raw_number in raw_numbers:
    phone_number = f"+91{raw_number}"
    print(f"📨 Sending to {phone_number}...")

    try:
        if image_files:
            # Send all images one-by-one with message as caption
            for img_path in image_files:
                print(f"🖼️ Sending image: {img_path}")
                kit.sendwhats_image(
                    receiver=phone_number,
                    img_path=img_path,
                    caption=message,
                    wait_time=15,
                    tab_close=True,
                    close_time=5
                )
                time.sleep(10)  # Pause between images
        else:
            # Just send text
            kit.sendwhatmsg_instantly(
                phone_number,
                message,
                wait_time=15,
                tab_close=True
            )

        time.sleep(15)  # Pause between contacts

    except Exception as e:
        print(f"❌ Failed for {phone_number}: {e}")

print("✅ All messages and images processed.")
