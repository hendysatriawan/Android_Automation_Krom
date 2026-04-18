# Android_Automation_Krom

Automated mobile testing project for Android using Robot Framework and Appium.

---

## Tech Stack

| Tool | Version |
|------|---------|
| Python | 3.11.13 |
| Appium | 3.3.0 |
| Robot Framework | latest |
| AppiumLibrary | latest |
| FakerLibrary | latest |

---

## Prerequisites

- Python 3.11+
- Node.js (required for Appium)
- Android Studio + Emulator (emulator-5554)
- Java JDK 11+

---

## Installation

### 1. Clone project
```bash
git clone <repo-url>
cd Android_Automation_Krom
```

### 2. Install Python dependencies
```bash
pip install -r requerments.txt
```

### 3. Install Appium
```bash
npm install -g appium@3.3.0
```

### 4. Install Appium UiAutomator2 driver
```bash
appium driver install uiautomator2
```

### 5. Download & Install APK
Download APK dari repositori resmi SauceLabs:
https://github.com/saucelabs/my-demo-app-android/releases/tag/2.2.0

Install ke emulator:
```bash
adb -s emulator-5554 install mda-2.2.0-25.apk
```

---

## Project Structure

```
Android_Automation_Krom/
├── manual_testcases/
│   └── Testcases.xlsx                  # Manual test cases reference
├── resources/
│   ├── resources.robot                 # Main resource file
│   ├── config/
│   │   ├── appium_capabilities.robot   # Device capabilities
│   │   ├── libraries.robot             # Library imports
│   │   └── data.robot                  # Test data & variables
│   ├── keywords/
│   │   ├── login_keywords.robot
│   │   ├── menu.robot
│   │   ├── catalog_keywords.robot
│   │   ├── cart_keywords.robot
│   │   └── checkout_keywords.robot
│   └── pages/
│       ├── common_page.robot
│       ├── login_page.robot
│       ├── catalog_lists_page.robot
│       ├── catalog_details_page.robot
│       ├── cart_page.robot
│       ├── checkout_sipping_page.robot
│       └── checkout_payment_page.robot
├── tests/
│   ├── login/
│   │   └── login_test.robot
│   ├── catalog/
│   │   └── catalog_test.robot
│   ├── cart/
│   │   └── cart_test.robot
│   └── checkout/
│       └── checkout_test.robot
├── results/
│   └── Reports/                        # Test reports output
├── requerments.txt
└── README.md
```

---

## Running Tests

### Start Appium server
```bash
appium
```

### Run all tests
```bash
robot --outputdir results/Reports tests/
```

### Run by module
```bash
robot --outputdir results/Reports tests/login/
robot --outputdir results/Reports tests/catalog/
robot --outputdir results/Reports tests/cart/
robot --outputdir results/Reports tests/checkout/
```

### Run by tag
```bash
# Run positive tests only
robot --include Positive --outputdir results/Reports tests/

# Run negative tests only
robot --include Negative --outputdir results/Reports tests/

# Run specific module tag
robot --include Login --outputdir results/Reports tests/
```

### Run with separate reports (positive & negative)
```bash
robot --include Positive --output results/Reports/output_positive.xml --log results/Reports/log_positive.html --report results/Reports/report_positive.html tests/

robot --include Negative --output results/Reports/output_negative.xml --log results/Reports/log_negative.html --report results/Reports/report_negative.html tests/
```

---

## View Existing Reports

Hasil report sudah tersedia di folder `results/Reports/`. Buka langsung di browser tanpa perlu running ulang:

### Positive Test Report
```bash
open results/Reports/report_positive.html
```
Atau buka manual file `results/Reports/report_positive.html` di browser.

### Negative Test Report
```bash
open results/Reports/report_negative.html
```
Atau buka manual file `results/Reports/report_negative.html` di browser.

### Detail Log
| File | Description |
|------|-------------|
| `report_positive.html` | Summary report positive test cases |
| `log_positive.html` | Detail log per step positive test cases |
| `report_negative.html` | Summary report negative test cases |
| `log_negative.html` | Detail log per step negative test cases |

---

## Tag Convention

| Tag | Description |
|-----|-------------|
| `Login` | Login module |
| `Catalog` | Catalog module |
| `Cart` | Cart module |
| `Checkout` | Checkout module |
| `Positive` | Positive test cases |
| `Negative` | Negative test cases |

---

## Device Configuration

Default device is `emulator-5554` with Android 13. To change device, update `resources/config/appium_capabilities.robot`:

```robotframework
&{emulator-5554}
...    deviceName=emulator-5554
...    platformVersion=13
```