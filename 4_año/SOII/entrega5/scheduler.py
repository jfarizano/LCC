import util

# (Nombre, llegada, t, prioridad, quantumsUsados)

def multiQueue(procesos, quantums, retro):
  queue0 = util.Queue()
  queue1 = util.Queue()
  queue2 = util.Queue()
  queue3 = util.Queue()

  (q0, q1, q2, q3) = quantums

  procesosFaltantes = procesos

  tick = 0

  for proceso in procesosFaltantes:
      (n, a, t, p, q) = proceso
      if a <= tick:
        print("Llega el proceso", n, "con tiempo de llegada", a, "en la cola", p)
        if (p == 0):
          queue0.push(proceso)
        elif (p == 1):
          queue1.push(proceso)
        elif (p == 2):
          queue2.push(proceso)
        else:
          queue3.push(proceso)
        procesosFaltantes.remove(proceso)
        

  while (True):
    print("==============================================")
    print("Inicia el tick ", tick)

    test = []
    for proceso in procesosFaltantes:
      (n, a, t, p, q) = proceso
      if a <= tick:
        print("Llega el proceso", n, "con tiempo de llegada", a, "en la cola", p)
        if (p == 0):
          queue0.push(proceso)
        elif (p == 1):
          queue1.push(proceso)
        elif (p == 2):
          queue2.push(proceso)
        else:
          queue3.push(proceso)
        test.append(proceso)
    for x in test:
      procesosFaltantes.remove(x)

    if (not queue0.isEmpty()):
      (name, arrival, t, p, q) = queue0.pop()
      if t <= q0:
        tick = tick + t
        print("El proceso ", name, "termina su ejecución con", t, "ticks restantes y ", q, "quantums usados")
      else:
        print("El proceso ", name, "se ejecuta con", t, "ticks restantes y ", q, "quantums usados")
        if q + 1 == 2 and retro:
          print("El proceso", name, "fue degradado")
          queue1.push((name, arrival, t - q0, p, 0))
        else:
          queue0.push((name, arrival, t - q0, p, q + 1))
        tick = tick + q0
    elif (not queue1.isEmpty()):
      (name, arrival, t, p, q) = queue1.pop()
      if t <= q1:
        tick = tick + t
        print("El proceso ", name, "termina su ejecución con", t, "ticks restantes y ", q, "quantums usados")
      else:
        print("El proceso ", name, "se ejecuta con", t, "ticks restantes y ", q, "quantums usados")
        if q + 1 == 2 and retro:
          print("El proceso", name, "fue degradado")
          queue2.push((name, arrival, t - q1, p, 0))
        else:
          queue1.push((name, arrival, t - q1, p, q + 1))
        tick = tick + q1
    elif (not queue2.isEmpty()):
      (name, arrival, t, p, q) = queue2.pop()
      if t <= q2:
        tick = tick + t
        print("El proceso ", name, "termina su ejecución con", t, "ticks restantes y ", q, "quantums usados")
      else:
        print("El proceso ", name, "se ejecuta con", t, "ticks restantes y ", q, "quantums usados")
        if q + 1 == 2 and retro:
          print("El proceso", name, "fue degradado")
          queue3.push((name, arrival, t - q2, p, 0))
        else:
          queue2.push((name, arrival, t - q2, p, q + 1))
        tick = tick + q2
    elif (not queue3.isEmpty()):
      (name, arrival, t, p, q) = queue3.pop()
      if t <= q3:
        tick = tick + t
        print("El proceso ", name, "termina su ejecución con", t, "ticks restantes y ", q, "quantums usados")
      else:
        print("El proceso ", name, "se ejecuta con", t, "ticks restantes y ", q, "quantums usados")
        queue3.push((name, arrival, t - q3, p, q + 1))
        tick = tick + q3
    elif (len(procesosFaltantes) > 0):
      if (tick != 0):
        print("No se ejecutó ningún proceso, aumentando un tick")
        tick = tick + 1
    else:
      print("No queda nada para ejecutar, terminando")
      break

    

def main():
  procesos = [("A", 0, 8, 0, 0),
              ("B", 2, 13, 2, 0),
              ("C", 4, 3, 1, 0),
              ("D", 4, 6, 0, 0)]
  multiQueue(procesos, (2, 2, 2, 2), True)

main()