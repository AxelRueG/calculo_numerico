# ejercicio Nro5
## usando polinomios en octave
p = [2 -3 0 2];

# muestra la salida como polinomio
polyout(p,'x')

# evalua los terminos del polinomio p con un x
polyval(p,10)
polyval(p,[0:1:10])

# calcula las raices
roots(p)

