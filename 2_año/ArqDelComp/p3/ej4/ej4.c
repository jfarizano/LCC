#include <stdio.h>
#include <math.h>

typedef struct nro
{
  int signo : 1;
  int exponente : 16;
  unsigned int fraccion : 18;
} nro;

int myisnan(nro n)
{
  return n.exponente == (1 << 15) - 1 && n.fraccion != 0;
}

int myisinf(nro n)
{
  return n.exponente == (1 << 15) - 1 && n.fraccion == 0;
}

int myiszero(nro n)
{
  return n.exponente == 0 && n.fraccion == 0;
}

nro nronan()
{
  nro nan;
  nan.signo = 0;
  nan.exponente = (1 << 15) - 1;
  nan.fraccion = 1;
  return nan;
}

nro nroinf()
{
  nro inf;
  inf.signo = 0;
  inf.exponente = (1 << 15) - 1;
  inf.fraccion = 0;
  return inf;
}

nro nrocero() 
{
  nro cero;
  cero.signo = 0;
  cero.exponente = 0;
  cero.fraccion = 0;
  return cero;
}

// Suma

nro suma(nro n1, nro n2)
{
  nro resultado;
  // Chequeamos que no sea infinito ni NaN.
  if (myisnan(n1) || myisnan(n2))
    return nronan();

  if (myisinf(n1) || myisinf(n2))
    return nroinf();

  if (myiszero(n1))
    return n2;

  if (myiszero(n2))
    return n1;

  // Igualamos exponentes.
  if (n1.exponente < n2.exponente)
  {
    n1.fraccion = n1.fraccion >> (n2.exponente - n1.exponente);
    n1.exponente = n2.exponente;
  }
  else if (n2.exponente < n1.exponente)
  {
    n2.fraccion = n2.fraccion >> (n1.exponente - n2.exponente);
    n2.exponente = n1.exponente;
  }
  resultado.exponente = n1.exponente; // Ahora los exponentes están igualados.
  // Sumamos las mantisas teniendo en cuenta el signo.
  if (n1.signo == n2.signo)
  {
    resultado.signo = n1.signo;
    resultado.fraccion = n1.fraccion + n2.fraccion;
  }
  else if (n1.signo != n2.signo)
  {
    if (n1.fraccion > n2.fraccion)
    {
      resultado.signo = n1.signo;
      resultado.fraccion = n1.fraccion - n2.fraccion;
    }
    else
    {
      resultado.signo = n2.signo;
      resultado.fraccion = n2.fraccion - n1.fraccion;
    }
  }
  // Normalizamos el resultado
  while ((resultado.fraccion & (1 << 17)) == 0)
  // Mientras el primer bit sea cero, desplazamos la mantisa y
  // corregimos el exponente.
  {
    resultado.fraccion = resultado.fraccion << 1;
    resultado.exponente = resultado.exponente - 1;
  }
  return resultado;
}

// Producto

nro multiplicacion(nro n1, nro n2)
{
  // Casos especiales


  if (myisnan(n1) || myisnan(n2))
    return nronan();

  if (myiszero(n1) || myiszero(n2))
    return nrocero();

  if ((myiszero(n1) && myisinf(n2)) || (myiszero(n2) && myisinf(n1)))
    return nronan();

  if (myisinf(n1) && myisinf(n2))
    return nroinf();

  
  nro resultado;
  // Sumamos los exponentes
  resultado.exponente = n1.exponente + n2.exponente;
  // Verificamos el signo
  resultado.signo = (n1.signo > n2.signo) ? n1.signo : n2.signo;
  // Multiplicamos las mantisas.
  resultado.fraccion = n1.fraccion * n2.fraccion;
  // Normalizamos el resultado
  while ((resultado.fraccion & (1 << 17)) == 0)
  // Mientras el primer bit sea cero, desplazamos la mantisa y
  // corregimos el exponente.
  {
    resultado.fraccion = resultado.fraccion << 1;
    resultado.exponente = resultado.exponente - 1;
  }
  return resultado;
}

int main()
{

  nro n1;
  nro n2;

  n1.signo = 0;
  n1.exponente = 2;
  n1.fraccion = 6;

  n2.signo = 0;
  n2.exponente = 4;
  n2.fraccion = 10;

  nro resultado = multiplicacion(n1, n2);

  printf("%d %d %d\n", resultado.signo, resultado.exponente, resultado.fraccion);

  return 0;
}