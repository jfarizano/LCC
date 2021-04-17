import util

# (Nombre, llegada, t, prioridad, quantumsUsados)

def multiQueue(procesos):
  queue0 = util.Queue()
  queue1 = util.Queue()
  queue2 = util.Queue()
  queue3 = util.Queue()

  procesosFaltantes = procesos

  tick = 0

  while (True):
    print("Inicia el tick ", tick)
    if (not queue0.isEmpty()):
      (name, arrival, t, p, q) = queue0.pop()
      if t <= 2:
        tick = tick + t
        print("El proceso ", name, "termina su ejecución con", t, "ticks restantes y ", q, "quantums usados")
      else:
        queue0.push((name, arrival, t - 2, p, q + 1))
        tick = tick + 2
        print("El proceso ", name, "se ejecuta con", t, "ticks restantes y ", q, "quantums usados")
    elif (not queue1.isEmpty()):
      (name, arrival, t, p, q) = queue1.pop()
      if t <= 2:
        tick = tick + t
        print("El proceso ", name, "termina su ejecución con", t, "ticks restantes y ", q, "quantums usados")
      else:
        queue1.push((name, arrival, t - 2, p, q + 1))
        tick = tick + 2
        print("El proceso ", name, "se ejecuta con", t, "ticks restantes y ", q, "quantums usados")
    elif (not queue2.isEmpty()):
      (name, arrival, t, p, q) = queue2.pop()
      if t <= 2:
        tick = tick + t
        print("El proceso ", name, "termina su ejecución con", t, "ticks restantes y ", q, "quantums usados")
      else:
        queue2.push((name, arrival, t - 2, p, q + 1))
        tick = tick + 2
        print("El proceso ", name, "se ejecuta con", t, "ticks restantes y ", q, "quantums usados")
    elif (not queue3.isEmpty()):
      (name, arrival, t, p, q) = queue3.pop()
      if t <= 2:
        tick = tick + t
        print("El proceso ", name, "termina su ejecución con", t, "ticks restantes y ", q, "quantums usados")
      else:
        queue3.push((name, arrival, t - 2, p, q + 1))
        tick = tick + 2
        print("El proceso ", name, "se ejecuta con", t, "ticks restantes y ", q, "quantums usados")
    elif (len(procesosFaltantes) > 0):
      if (tick != 0):
        print("No se ejecutó ningún proceso, aumentando un tick")
        tick = tick + 1
    else:
      break

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
    

def main():
  procesos = [("A", 0, 8, 0, 0),
              ("B", 2, 13, 2, 0),
              ("C", 4, 3, 1, 0),
              ("D", 4, 6, 0, 0)]
  multiQueue(procesos)

main()