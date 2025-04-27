#!/bin/bash

# Color codes
GREEN='\e[32m'
RED='\e[31m'
YELLOW='\e[33m'
NC='\e[0m' # No Color

# Check if required tools are installed
required_tools=(subfinder assetfinder amass nmap nikto zap-cli wapiti sqlmap aquatone)
for tool in "${required_tools[@]}"; do
    if ! command -v "$tool" &> /dev/null; then
        echo -e "${RED}Error: $tool is not installed. Please run install_tools.sh.${NC}"
        exit 1
    fi
done

# Check for input domain
if [ "$#" -ne 1 ]; then
    echo -e "${RED}Usage: $0 <domain>${NC}"
    exit 1
fi

DOMAIN=$1
OUTPUT_DIR="scans/$DOMAIN"
mkdir -p "$OUTPUT_DIR"

# Function to log start and end time
log_time() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# Subdomain Enumeration
echo -e "${YELLOW}Starting subdomain enumeration...${NC}"
log_time "Subdomain enumeration started"
{
    subfinder -d "$DOMAIN" -o "$OUTPUT_DIR/subfinder.txt" &&
    assetfinder --subs-only "$DOMAIN" >> "$OUTPUT_DIR/assetfinder.txt" &&
    amass enum -d "$DOMAIN" -o "$OUTPUT_DIR/amass.txt"
} || {
    echo -e "${RED}Subdomain enumeration failed.${NC}"
}
log_time "Subdomain enumeration completed"

# Port and Vulnerability Scanning
echo -e "${YELLOW}Starting port and vulnerability scanning...${NC}"
log_time "Nmap scan started"
{
    nmap -sV --script=vuln "$DOMAIN" -oN "$OUTPUT_DIR/nmap_vuln.txt"
} || {
    echo -e "${RED}Nmap scan failed.${NC}"
}
log_time "Nmap scan completed"

# Web Vulnerability Scanning
echo -e "${YELLOW}Starting web vulnerability scanning...${NC}"
log_time "Nikto scan started"
{
    nikto -h "$DOMAIN" -o "$OUTPUT_DIR/nikto.txt"
} || {
    echo -e "${RED}Nikto scan failed.${NC}"
}
log_time "Nikto scan completed"

log_time "OWASP ZAP scan started"
{
    zap-cli quick-scan --self-contained --spider "$DOMAIN" --output "$OUTPUT_DIR/zap_output.html"
} || {
    echo -e "${RED}OWASP ZAP scan failed.${NC}"
}
log_time "OWASP ZAP scan completed"

log_time "Wapiti scan started"
{
    wapiti -u "$DOMAIN" -f html -o "$OUTPUT_DIR/wapiti_output.html"
} || {
    echo -e "${RED}Wapiti scan failed.${NC}"
}
log_time "Wapiti scan completed"

# SQL Injection Testing
echo -e "${YELLOW}Starting SQL injection testing...${NC}"
log_time "SQLMap scan started"
{
    sqlmap -u "http://$DOMAIN" --batch --output-dir="$OUTPUT_DIR/sqlmap_output"
} || {
    echo -e "${RED}SQLMap scan failed.${NC}"
}
log_time "SQLMap scan completed"

# Screenshots
echo -e "${YELLOW}Taking screenshots...${NC}"
log_time "Aquatone scan started"
{
    aquatone -url "$DOMAIN" -out "$
