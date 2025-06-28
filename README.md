🔥 Ce este?
Un script care îți face rapid un snapshot logic al fișierelor importante din sistem (config, home, etc), și îți permite să dai un “restore” într-un punct anterior în timp — chiar dacă nu folosești Btrfs/ZFS sau Timeshift.

E ca o mini mașină a timpului… în Bash.

🎯 Ce face:
📦 Creează "checkpoint-uri" ale sistemului tău (fișiere critice: /etc, ~, dotfiles, configuri).

📁 Salvează doar modificările (delta, cu rsync și diff).

🔙 Permite restore selectiv sau total la un checkpoint anterior.

💾 Opțional: arhivează checkpoint-urile într-un drive extern/remote.

✅ Ce face acest script mai special decât un simplu backup?
Este interactiv, rapid și ultra-lightweight.

Nu presupune configurare complicată (nu e nevoie de Timeshift, rsnapshot, etc).

Salvează doar folderele relevante.

Funcționează pe orice sistem de fișiere.

Poți face snapshot înainte de:

modificări de config (ex: nginx, ssh)

update major

instalări dubioase

sesiuni de hacking / sysadmin

🛠️ Setup:
Salvează ca timetravel.sh

Fă-l executabil: chmod +x timetravel.sh

Rulează-l cu sudo (pentru acces la /etc):

sudo ./timetravel.sh

🔮 Extensii viitoare:
Integrare cu Git pentru ~/.dotfiles

Upload automat pe cloud (ex: rclone, s3)

Comparație între snapshot-uri (diff -r)

Restore doar un anumit fișier din snapshot

🧠 Dacă vrei „undo” la nivel de fișiere și configuri în câteva secunde… timetravel.sh e genul de script pe care te rogi să-l fi avut înainte de un update prost.
