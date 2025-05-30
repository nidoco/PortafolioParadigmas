---
title: "Práctica 4: Paradigma Lógico"
date: 2025-03-30T10:19:41-08:00  # Formato YYYY-MM-DD
draft: false
author: "Jennifer Salgado"
tags: [Prolog]
---

# Práctica 4
## Paradigmas de programación
En esta práctica, analizaremos el paradigma lógico y el lenguaje Prolog, estudiando sus conceptos básicos, su funcionamiento y su aplicación. El propósito es adquirir familiaridad con los fundamentos de Prolog, incluyendo su sintaxis y su uso en la resolución de problemas basados en lógica.

### **¿En qué consiste el Paradigma Lógico?**

El paradigma lógico parte de la idea de que los programas se componen de afirmaciones lógicas (hechos y reglas). A diferencia de los lenguajes imperativos, que indican cómo ejecutar una tarea, este enfoque define qué es verdadero y permite que el sistema deduzca las conclusiones automáticamente. Un programa lógico opera sobre una base de conocimiento, donde el usuario realiza consultas y el sistema (mediante un motor de inferencia) se encarga de encontrar las respuestas.

###  **¿Qué es Prolog?**

Prolog (PROgramming in LOGic) es el principal lenguaje representante del paradigma lógico. Basado en la lógica de primer orden, es ampliamente utilizado en inteligencia artificial, procesamiento de lenguaje natural y sistemas expertos. Su motor de inferencia emplea un algoritmo de resolución para derivar nuevos hechos a partir de los datos proporcionados.

## Primeros Pasos con Prolog*

### Instalación
La implementación más utilizada de Prolog es **SWI-Prolog**. A continuación, se detallan los pasos básicos para su instalación:  

1. **Descargar SWI-Prolog**:  
   - Visita el [sitio web oficial de SWI-Prolog](https://www.swi-prolog.org/).  
   - Selecciona la versión compatible con tu sistema operativo (Windows, macOS o Linux).  

2. **Instalar SWI-Prolog**:  
   - Ejecuta el instalador y sigue las instrucciones paso a paso.  

3. **Verificar la instalación**:  
   - Abre una terminal o línea de comandos y escribe `swipl`.  
   - Si aparece el prompt `?-`, significa que la instalación se realizó correctamente.  

**Opción alternativa**:  
Si prefieres no instalar nada, puedes utilizar entornos en línea como **[SWISH](https://swish.swi-prolog.org/)**, que permite ejecutar Prolog directamente desde el navegador.  

## Ejecutando un "Hola Mundo" en el intérprete
Al iniciar SWI-Prolog, aparece el prompt `?-` donde podemos ingresar comandos directamente. Para mostrar un mensaje simple:

```bash
?- write('¡Hola, Mundo!'), nl.
```
Este comando realiza dos acciones:

1. ``write()`` muestra el texto entre comillas

2. ``nl() ``agrega un salto de línea.

    El sistema responde true., confirmando la ejecución correcta.

**Regla clave:** Todo enunciado en Prolog debe finalizar con punto (.).

**Finalizando la sesión**

Para cerrar el intérprete existen dos métodos:

**Comando directo:**`` halt.``

**Atajo de teclado:** ``Ctrl+D`` (Linux/Mac) o ``Ctrl+C`` seguido de e (Windows)

### Desarrollo en archivos fuente
La práctica recomendada es guardar el código en archivos .pl. Ejemplo:

```prolog
% Definición de un predicado simple
saludar :-
    write('¡Hola desde un archivo!'),  % Mensaje a mostrar
    nl.                                % Nueva línea
```
**Uso del archivo:**
1. Carga el programa:
```bash
?- ['hola.pl'].  % Forma abreviada
% Alternativa: consult('hola.pl').
```
2. Ejecuta el predicado: 
```bash
?- saludar.
¡Hola desde un archivo!
true.
```

**Convenciones para comentarios:**
* Comentario lineal: Inicia con % (válido hasta final de línea)
```prolog
% Esto explica una sola línea
```
* Bloque comentado: Encierra entre `/* */`
```prolog
/* Este comentario puede  
   abarcar múltiples
   renglones */
```
## ¿Qué son los hechos en Prolog?
En Prolog, los hechos son declaraciones que representan información verdadera sobre un dominio específico. Definen relaciones entre objetos o propiedades de estos, formando la base del conocimiento del programa.

**Sintaxis para Definir Hechos:**
* **Nomenclatura:**

    Los predicados (nombres de relaciones) y átomos (objetos concretos) comienzan con minúscula.

    Ejemplo: gato(tom). → gato es el predicado y tom el átomo.

* **Estructura:**
    
    Predicado seguido de argumentos entre paréntesis, separados por comas. Termina siempre con un punto (.).
    
    **Ejemplo:** padre(juan, maria). (Juan es padre de María).

* **Semántica:**
    
    Un hecho como vuela(pajaro). afirma que "los pájaros vuelan".
    Prolog lo interpreta como una verdad absoluta dentro del programa.

**Importancia**

* Son la base para consultas y reglas.

* Permiten modelar conocimiento de forma declarativa.

* **Ejemplo de consulta:**
    ```bash
    ?- gato(tom).  % Prolog responderá 'true.' si el hecho existe.
    ```

## Reglas de Prolog
Las reglas en Prolog son la herramienta fundamental para establecer relaciones lógicas entre diferentes elementos de conocimiento. Permiten crear conclusiones basadas en condiciones específicas, dando flexibilidad y poder expresivo a los programas.

**Estructura Fundamental de las Reglas**
Cada regla se compone de dos partes principales:

1. **Conclusión (cabeza):** Representa el resultado que queremos validar

2. **Premisas (cuerpo):** Condiciones que deben cumplirse para que la conclusión sea verdadera

La sintaxis básica sigue este patrón:
```prolog
conclusion(Argumentos) :- condicion1(Arg1), condicion2(Arg2).
```

**Operadores Lógicos Clave**

* **Implicación (:-):** Se lee como "si" o "solamente si"

* **Conjunción (,):**Operador "Y" lógico (todas las condiciones deben ser verdaderas)

* **Disyunción (;):** Operador "O" lógico (al menos una condición debe ser verdadera)

**Ejemplos Ilustrativos**
1. Relación simple:
```prolog
% Si alguien estudia, entonces es aplicado
es_aplicado(Alumno) :- estudia(Alumno).
```
2. Relación compuesta (AND):
```prolog
% Dos personas son colegas si trabajan en la misma empresa
son_colega(Persona1, Persona2) :- 
trabaja_en(Persona1, Empresa),
trabaja_en(Persona2, Empresa).
```
3. Alternativas (OR):
```prolog
% Alguien está entretenido si ve películas o lee libros
entretenido(Persona) :- ve_peliculas(Persona); lee_libros(Persona).
```

## Consideraciones Importantes
1. **Precedencia de operadores:**
 Las comas (AND) tienen mayor prioridad que los punto y coma (OR). Se pueden usar paréntesis para agrupar condiciones

2. **Buenas prácticas:** Mantener nombres de predicados en minúscula. Usar nombres descriptivos para variables y predicados. Comentar adecuadamente las reglas complejas

3. **Ejecución práctica:** Prolog evalúa las condiciones de izquierda a derecha. Busca unificar las variables con hechos conocidos. Puede generar múltiples soluciones mediante backtracking

## Aplicación en Problemas Reales
Las reglas permiten modelar conocimiento complejo como:
```prolog
% Definición de relación familiar
es_abuelo(Abuelo, Nieto) :-
es_padre(Abuelo, Padre),
es_padre(Padre, Nieto).
```

Este enfoque declarativo hace que Prolog sea especialmente útil para:
* Sistemas expertos
* Representación de conocimiento
* Solución de problemas lógicos
* Procesamiento de lenguaje natural
## Queries
Las consultas son preguntas que se hacen a la base de conocimiento. Prolog intentará satisfacer la consulta buscando hechos y aplicando reglas.
```bash
?- gato(tom).        % ¿Es Tom un gato?
true.

?- le_gusta_comer(jorge, pizza). % ¿A Jorge le gusta comer pizza?
false. % (si no está en la base de conocimiento)

?- feliz(lili).      % ¿Está Lili feliz?
% Prolog intentará satisfacer baila(lili).
```
Las variables (empiezan con Mayúscula) permiten hacer preguntas más generales:
```prolog
?- le_gusta_comer(jorge, Comida).
Comida = pasta.
```
## Base de Conocimiento

Un conjunto de hechos y reglas forma una base de conocimiento. Usualmente se guarda en un archivo con extensión .pl.

**Ejemplo: kb1.pl**
```prolog
% kb1.pl
chica(priya).
chica(natasha).
chica(jasmin).

sabe_cocinar(priya).
```
**Para usarla:**
```bash
?- [kb1].
true.
```
```prolog
?- chica(X).
X = priya ; % presiona ; para buscar más soluciones
X = natasha ;
X = jasmin.

?- sabe_cocinar(jasmin).
false.
```

## Relaciones en Prolog
Prolog se destaca en definir y consultar relaciones complejas.

**Ejemplo Práctico: Familia**
Considera el siguiente archivo familia.pl:
```prolog
% Hechos: parent(PadreMadre, HijoHija)
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).
parent(peter, jim). % Corregido de 'pete' en PDF para consistencia visual

% Hechos: male(Persona), female(Persona)
male(tom).
male(bob).
male(jim).
male(peter).
female(pam).
female(liz).
female(ann).
female(pat).

% Reglas
mother(Madre, HijoHija) :-
    parent(Madre, HijoHija),
    female(Madre).

father(Padre, HijoHija) :-
    parent(Padre, HijoHija),
    male(Padre).

has_child(Persona) :-
    parent(Persona, _). % _ es una variable anónima

sister(Hermana, Persona) :-
    parent(PadreMadre, Hermana),
    parent(PadreMadre, Persona),
    female(Hermana),
    Hermana \== Persona. % \== significa "no es idéntico a"

brother(Hermano, Persona) :-
    parent(PadreMadre, Hermano),
    parent(PadreMadre, Persona),
    male(Hermano),
    Hermano \== Persona.

grandparent(AbueloAbuela, NietoNieta) :-
    parent(AbueloAbuela, PadreMadreIntermedio),
    parent(PadreMadreIntermedio, NietoNieta).
```
**Consultas:**
```bash
?- [familia].
true.

?- mother(X, bob).
X = pam.

?- sister(ann, pat).
true.

?- grandparent(tom, ann).
true.
```
## Recursión en Relaciones Familiares
Podemos definir un "predecesor" (ancestro) recursivamente:
```prolog
% X es predecesor de Z si X es padre/madre de Z (caso base)
predecessor(X, Z) :- parent(X, Z).

% X es predecesor de Z si X es padre/madre de Y,
% y Y es predecesor de Z (caso recursivo)
predecessor(X, Z) :- parent(X, Y), predecessor(Y, Z).
```
**Consultas:**
```bash
?- predecessor(tom, jim).
true.
```
## Tipos de Datos en Prolog (Términos)
Prolog trabaja con diferentes estructuras de datos llamadas términos, que se clasifican en:

1. **Átomos**
    
    Representan nombres simbólicos o constantes.

   **Sintaxis:**
    Comienzan con minúscula: `gato, azul, x25`. Si contienen espacios o inician con mayúscula, van entre comillas simples: `'Átomos en Prolog', 'Juan'.`

    **Ejemplos:**
    ```prolog
    rojo, 'Hola Mundo', mesa, _123.
    ```

2. **Números**

    Soporta enteros y flotantes:
    ```prolog
    42, -15, 3.1416, 1000.
    ```
3. **Variables**

    Simbolizan valores desconocidos que Prolog intenta determinar (instanciar).

    **Reglas:** Inician con mayúscula o guion bajo `(_): X, Resultado, _temp.` No son lo mismo que variables matemáticas; representan incógnitas a resolver.

    **Ejemplo:**
    ```prolog
    ?- padre(X, juan).  % Busca quién es padre de Juan
    ```
4. **Variables Anónimas (_)**

    Se usan cuando el valor es irrelevante.
    Cada _ en una regla se considera diferente.

    **Ejemplo:**
    ```prolog
    tiene_hijo(P) :- padre(P, _).  % P tiene hijo, no importa quién
    ```
5. **Estructuras (Términos Compuestos)**

    Agrupan datos bajo un functor (nombre) y argumentos. Sintaxis: functor(arg1, arg2, ...).

    **Usos comunes:**
    Representar objetos complejos: punto(3, 5), fecha(12, agosto, 2023).
    Los hechos y reglas son estructuras:
    ```prolog
    padre(juan, maria).       % Hecho: estructura con aridad 2
    rectangulo(punto(0,0), punto(5,5)). % Estructura anidada
    `` 

### **Operadores en Prolog: Comparación y Aritmética**

#### **1. Operadores de Comparación**  
Permiten evaluar relaciones **numéricas** entre términos. Retornan `true` o `false`.  

| Operador | Descripción                     | Ejemplo (Consulta) | Resultado |
|----------|---------------------------------|--------------------|-----------|
| `>`      | Mayor que                       | `?- 5 > 3.`        | `true`    |
| `<`      | Menor que                       | `?- 2 < 1.`        | `false`   |
| `>=`     | Mayor o igual que               | `?- 4 >= 4.`       | `true`    |
| `=<`     | Menor o igual que (¡ojo al `=`) | `?- 3 =< 5.`       | `true`    |
| `=:=`    | Igualdad numérica               | `?- 7 =:= 3+4.`    | `true`    |
| `=\=`    | Desigualdad numérica            | `?- 5 =\= 2*3.`    | `true`    |

**Notas clave**:  
- **`=`** (unificación) vs **`=:=`** (igualdad numérica):  
  ```prolog
  ?- X = 5, X =:= 5.  % Primero unifica X con 5, luego compara
  true.
  ```
- **`=\=`** es para números; **`\==`** compara términos estructuralmente diferentes.

---

#### **2. Operadores Aritméticos**  
Realizan cálculos matemáticos. **Requieren el operador `is` para evaluar expresiones**.  

| Operador | Descripción          | Ejemplo (Cálculo)       | Resultado |
|----------|----------------------|-------------------------|-----------|
| `+`      | Suma                 | `?- X is 3 + 2.`        | `X = 5`   |
| `-`      | Resta                | `?- X is 10 - 4.`       | `X = 6`   |
| `*`      | Multiplicación       | `?- X is 5 * 3.`        | `X = 15`  |
| `/`      | División (flotante)  | `?- X is 10 / 2.`       | `X = 2.5` |
| `**`     | Potencia             | `?- X is 2 ** 3.`       | `X = 8`   |
| `//`     | División entera      | `?- X is 7 // 2.`       | `X = 3`   |
| `mod`    | Módulo               | `?- X is 10 mod 3.`     | `X = 1`   |

**Sintaxis fundamental**:  
```prolog
Resultado is Expresión_Aritmética.
```

**Ejemplo combinado**:  
```prolog
?- X is (5 + 3) * 2 - 4.  % X = (8 * 2) - 4 → X = 12
```

**Advertencias**:  
- **`is` no unifica algebraicamente**:  
  ```prolog
  ?- 10 is 5 + X.  % Error: ¡X debe estar instanciado!
  ```
- **Precedencia de operadores**:  
  `*, /, //, mod` tienen mayor precedencia que `+, -`.

---

#### **3. Casos Prácticos**  
**Comparación en reglas**:  
```prolog
es_mayor(X, Y) :- X > Y.  % Verifica si X es mayor que Y
```
**Uso en consultas**:  
```prolog
?- es_mayor(7, 5).
true.
```

**Cálculo de factorial (recursivo)**:  
```prolog
factorial(0, 1).
factorial(N, F) :- 
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.
```
**Consulta**:  
```prolog
?- factorial(5, X).  % X = 120
```

---

#### **Diferencias Clave**  
| Operador | Uso                     | Ejemplo              |
|----------|-------------------------|----------------------|
| `=`      | Unificación             | `X = 5` (asigna)     |
| `=:=`    | Comparación numérica    | `5 + 3 =:= 8`        |
| `is`     | Evaluación aritmética   | `X is 2 + 2`         |

**Consejo**: Usa paréntesis para claridad en expresiones complejas:  
```prolog
?- X is (2 + 3) * (4 - 1).  % X = 15
``` 
## Conclusión
Esta práctica ha representado una inmersión esencial en Prolog y su paradigma lógico, destacando su enfoque único para resolver problemas mediante declaraciones de hechos y reglas, en lugar de instrucciones secuenciales. Aunque tiene limitaciones en eficiencia para ciertos cálculos numéricos, brilla en problemas donde la expresividad lógica es prioritaria.

‎‧₊˚✧[Repositorio](https://github.com/nidoco/PortafolioParadigmas)✧˚₊‧

「 ✦ [Pagina](https://nidoco.github.io/PortafolioParadigmas/) ✦ 」
