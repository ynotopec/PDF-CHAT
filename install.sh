#!/bin/bash

# Définition des variables
OPENAI_API_BASE="https://api.example.com/v1"
OPENAI_API_KEY="" # Clé API OpenAI (à définir par l'utilisateur)
USERNAME="ailab"
GITHUB_REPO="https://github.com/alejandro-ao/ask-multiple-pdfs"

# Vérification des droits root
if [[ $EUID -ne 0 ]]; then
    echo "Ce script doit être exécuté en tant que root."
    exit 1
fi

# Demander la clé API OpenAI
read -p "Entrez votre clé API OpenAI: " OPENAI_API_KEY

# Création de l'utilisateur
useradd ${USERNAME} -s /bin/bash -d /home/${USERNAME} -m -k /etc/skel

# Mise à jour et installation des dépendances
apt update
apt upgrade -y
apt install python3-venv git -y

# Configuration de l'environnement utilisateur
su - ${USERNAME} <<EOF
mkdir -p ~/python3-venv ~/fastchat
python3 -m venv ~/python3-venv
source ~/python3-venv/bin/activate
git clone ${GITHUB_REPO}
cd ask-multiple-pdfs
python3 -m pip install -r requirements.txt
EOF

# Configuration du service systemd
cat <<EOT >/etc/systemd/system/ask-multiple-pdfs.service
[Unit]
Description=ask-multiple-pdfs
After=network.target
Requires=network.target
[Service]
WorkingDirectory=/home/${USERNAME}/ask-multiple-pdfs
Environment="OPENAI_API_BASE=${OPENAI_API_BASE}"
Environment="OPENAI_API_KEY=${OPENAI_API_KEY}"
ExecStart=/bin/bash -c 'cd /home/${USERNAME}/ask-multiple-pdfs && source /home/${USERNAME}/python3-venv/bin/activate && python3 -m streamlit run app.py'
TimeoutStartSec=60
User=${USERNAME}
[Install]
WantedBy=multi-user.target
EOT

# Activation et démarrage du service
systemctl daemon-reload
systemctl enable ask-multiple-pdfs.service
systemctl start ask-multiple-pdfs.service

echo "Installation terminée. Le service PDF+CHAT est maintenant actif."
