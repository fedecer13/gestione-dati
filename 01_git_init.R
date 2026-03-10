# ============================================================
# Git + GitHub da R/RStudio 
# ============================================================
# Obiettivo:
# 1) dire a Git chi sei (nome + email) -> serve per firmare/attribuire i commit
# 2) verificare che la configurazione sia stata salvata
# 3) creare un GitHub token (PAT) -> serve per autenticarsi su GitHub (push/pull)
# 4) salvare il token in modo sicuro sul computer (così non lo reinserisci ogni volta)
#
# Nota:
# - Esegui queste righe nella Console di RStudio (o in R).
# - Se sei su Windows e Git non è nel PATH, vedi la sezione "Windows users" più sotto.
# ============================================================


# --- 1) Imposta l'email usata da Git per i commit (metti la TUA email) ---
system('git config --global user.email "federico.cerroni@student.univaq.it"')

# --- 2) Imposta il nome usato da Git per i commit (metti il TUO nome e cognome) ---
system('git config --global user.name "FedericoCerroni"')

# --- 3) Controlla che Git abbia salvato le impostazioni globali ---
# (stampa la lista delle configurazioni globali; cerca user.name e user.email)
system("git config --global --list")
system("gift config --local -l")

# ============================================================
# Windows users (solo se i comandi sopra NON funzionano)
# ============================================================
# Problema tipico: R non trova "git" perché Git non è nel PATH di sistema.
# Soluzione: specifichiamo il percorso completo di git.exe e lo usiamo nei comandi.

# Esempio di percorso standard (può variare!):
# git <- '"C:/Program Files/Git/cmd/git.exe"'

# Imposta email:
# system(paste(git, 'config --global user.email "federico.cerroni@student.univaq.it"'))

# Imposta nome:
# system(paste(git, 'config --global user.name "FedericoCerroni"'))

# Verifica:
# system(paste(git, "config --global --list"))


# ============================================================
# GitHub Token (PAT) + salvataggio credenziali
# ============================================================
# Per fare push/pull su GitHub NON si usa più la password dell’account.
# Si usa un Personal Access Token (PAT): una “password” generata da GitHub.
# se non funziona installare prima i pacchetti usethis e gitcreds:
# installa i pacchetti necessari (una sola volta)
# install.packages(c("usethis","gitcreds"))
# --- 4) Apri nel browser la pagina di GitHub per creare un token ---
# (ti si apre GitHub: crea un token, copialo subito perché poi non verrà mostrato di nuovo)
usethis::create_github_token()

# --- 5) Salva il token nel credential manager usato da Git sul tuo computer ---
# (quando chiede "Enter password or token:", incolla il token e premi invio)
gitcreds::gitcreds_set()

usethis::use_git_config(user.name = "FedericoCerroni", user.email = "federico.cerroni@student.univaq.it")
usethis::use_git_remote(name="origin", url= "https://github.com/fedecer13/gestione-dati.git")

