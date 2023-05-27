import tkinter as tk
import subprocess




def Nmap():
    subprocess.Popen(['gnome-terminal','-x', 'bash', '-c', './nmap.sh ; read'])




# Fonction appelée lorsqu'un bouton est cliqué
btn1 = tk.Button(
	text="Nmap",
    activeforeground="grey",
    activebackground="white",
    padx=8,
    pady=5,
    command=Nmap
)
   

# Création de la fenêtre principale
window = tk.Tk()
window.title("Script Nmap")



btn1.pack(side=tk.LEFT)

# Lancement de la boucle principale de l'interface
window.mainloop()

