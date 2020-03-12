import time

def contraseña():

    contraseña = "Permiso"
    intentos = 3

    while intentos != 0:
        print("Intentos restantes: ", intentos)
        entrada = input("Ingrese la contraseña: ")

        if entrada == contraseña:
            print("Acceso concedido")
            exit()
        else:
            intentos -= 1
            print("ACCESO DENEGADO")

    print("TERMINAL BLOQUEADA, AHORA TE CAE EL FBI PERRO")
    time.sleep(3)
    print("FBI, LAS MANOS ARRIBAS\n"*50)

contraseña()