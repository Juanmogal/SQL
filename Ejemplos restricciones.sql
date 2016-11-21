--Crea una base de datos llamada Ejemplos.
CREATE DATABASE Ejemplos

Crea las tablas siguientes:
/*DatosRestrictivos. Columnas:
ID Es un SmallInt autonumérico que se rellenará con números impares.. No admite nulos. Clave primaria
Nombre: Cadena de tamaño 15. No puede empezar por "N” ni por "X” Añade una restiricción UNIQUE. No admite nulos
Numpelos: Int con valores comprendidos entre 0 y 145.000
TipoRopa: Carácter con uno de los siguientes valores: "C”, "F”, "E”, "P”, "B”, ”N”
NumSuerte: TinyInt. Tiene que ser un número divisible por 3.
Minutos: TinyInt Con valores comprendidos entre 20 y 85 o entre 120 y 185.*/

CREATE TABLE DatosRestrictivos(
ID SmallInt Not Null CONSTRAINT PK_ID_DatosRestrictivos Primary Key IDENTITY(1,2) check(ID%2!=0),
Nombre Varchar (15) Not Null CHECK (Nombre LIKE '[^n,x]%') UNIQUE,
Numpelos Int CHECK(NumPelos between 0 and 145000),
TipoRopa Char(1) CHECK(TipoRopa LIKE 2Q'[cfepbn]'),
NumSuerte TinyInt CHECK(NumSuerte%3=0), 
Minutos TinyInt CHECK((Minutos between 20 and 85) OR (Minutos between 120 and 185))
)
DROP TABLE DatosRestrictivos
/*DatosRelacionados. Columnas:
NombreRelacionado: Cadena de tamaño 15. Define una FK para relacionarla con la columna "Nombre” de la tabla DatosRestrictivos.
¿Deberíamos poner la misma restricción que en la columna correspondiente?
¿Qué ocurriría si la ponemos?
¿Y si no la ponemos?
PalabraTabu: Cadena de longitud max 20. No admitirá los valores "Barcenas”, "Gurtel”, "Púnica”, "Bankia” ni "sobre”. Tampoco admitirá ninguna palabra terminada en "eo”
NumRarito: TinyInt menor que 20. No admitirá números primos.
NumMasgrande: SmallInt. Valores comprendidos entre NumRarito y 1000. Definirlo como clave primaria.
¿Puede tener valores menores que 20?
DatosAlMogollon. Columnas:
ID. SmallInt. No admitirá múltiplos de 5. Definirlo como PK
LimiteSuperior. SmallInt comprendido entre 1500 y 2000.
OtroNumero. Será mayor que el ID y Menor que LimiteSuperior. Poner UNIQUE
NumeroQueVinoDelMasAlla: SmallInt FK relacionada con NumMasGrande de la tabla DatosRelacionados
Etiqueta. Cadena de 3 caracteres. No puede tener los valores "pao”, "peo”, "pio” ni "puo”*/