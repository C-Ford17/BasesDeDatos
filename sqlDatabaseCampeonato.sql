CREATE TABLE IF NOT EXISTS public."Cargos"
(
    "idCargo" integer NOT NULL,
    nombre varchar(300) NOT NULL,
    CONSTRAINT "Cargos_pkey" PRIMARY KEY ("idCargo")
);

CREATE TABLE IF NOT EXISTS public."CategoriasEdad"
(
    "idCategoriaEdad" integer NOT NULL,
    nombre varchar(200) NOT NULL,
    CONSTRAINT "CategoriasEdad_pkey" PRIMARY KEY ("idCategoriaEdad")
);

CREATE TABLE IF NOT EXISTS public."Ciudades"
(
    "idCiudad" integer NOT NULL,
    nombre varchar(300) NOT NULL,
    "altitudSobreNivelDelMar" integer NOT NULL,
    "temperaturaPromedio" real NOT NULL,
    "idPais" integer NOT NULL,
    CONSTRAINT "Ciudades_pkey" PRIMARY KEY ("idCiudad")
);

CREATE TABLE IF NOT EXISTS public."Clubes"
(
    "idClub" integer NOT NULL,
    nombre varchar(300) NOT NULL,
    email varchar(300) NOT NULL,
    "idCiudadSede" integer NOT NULL,
    CONSTRAINT "Clubes_pkey" PRIMARY KEY ("idClub")
);

CREATE TABLE IF NOT EXISTS public."CompetidoresEnSeries"
(
    "idSerie" integer NOT NULL,
    "idPersona" integer NOT NULL,
    carril integer NOT NULL,
    "sePresentoACompetencia" boolean NOT NULL,
    tiempo time,
    "fueDescalificado" boolean,
    CONSTRAINT "CompetidoresEnSeries_pkey" PRIMARY KEY ("idSerie", "idPersona")
);

CREATE TABLE IF NOT EXISTS public."Deportistas"
(
    "idPersona" integer NOT NULL,
    "fechaPrimeraCompetenciaOficial" date,
    "idEstiloPrincipal" integer NOT NULL,
    "idCategoriaEdad" integer NOT NULL,
    "idClub" integer NOT NULL,
    CONSTRAINT "Deportistas_pkey" PRIMARY KEY ("idPersona")
);

CREATE TABLE IF NOT EXISTS public."Directivos"
(
    "idPersona" integer NOT NULL,
    "idCargo" integer NOT NULL,
    "idClub" integer NOT NULL,
    CONSTRAINT "Directivos_pkey" PRIMARY KEY ("idPersona")
);

CREATE TABLE IF NOT EXISTS public."Entrenadores"
(
    "idPersona" integer NOT NULL,
    "numeroLicenciaDeportiva" integer NOT NULL,
    "esEntrenadorPrincipal" boolean NOT NULL,
    "idClub" integer NOT NULL,
    CONSTRAINT "Entrenadores_pkey" PRIMARY KEY ("idPersona")
);

CREATE TABLE IF NOT EXISTS public."Estilos"
(
    "idEstilo" integer NOT NULL,
    nombre varchar(100) NOT NULL,
    descripcion varchar(300) NOT NULL,
    CONSTRAINT "Estilos_pkey" PRIMARY KEY ("idEstilo")
);

CREATE TABLE IF NOT EXISTS public."Eventos"
(
    "idEvento" integer NOT NULL,
    "numeroConsecutivo" integer NOT NULL,
    "idJornada" integer NOT NULL,
    CONSTRAINT "Eventos_pkey" PRIMARY KEY ("idEvento")
);

CREATE TABLE IF NOT EXISTS public."Inscripciones"
(
    "idPersona" integer NOT NULL,
    "idPrueba" integer NOT NULL,
    "tiempoInscripcion" time,
    CONSTRAINT "Inscripciones_pkey" PRIMARY KEY ("idPersona", "idPrueba")
);

CREATE TABLE IF NOT EXISTS public."Jornadas"
(
    "idJornada" integer NOT NULL,
    fecha date NOT NULL,
    "horaInicioCalentamiento" time NOT NULL,
    "horaInicioPruebas" time NOT NULL,
    CONSTRAINT "Jornadas_pkey" PRIMARY KEY ("idJornada")
);

CREATE TABLE IF NOT EXISTS public."Paises"
(
    "idPais" integer NOT NULL,
    nombre varchar(200) NOT NULL,
    CONSTRAINT "Paises_pkey" PRIMARY KEY ("idPais")
);

CREATE TABLE IF NOT EXISTS public."Personas"
(
    "idPersona" integer NOT NULL,
    "primerNombre" varchar(200) NOT NULL,
    "otrosNombre" varchar(200),
    "primerApellido" varchar(200) NOT NULL,
    "otrosApellido" varchar(200),
    email varchar(300) NOT NULL,
    "fechaNacimiento" date NOT NULL,
    "idCuidadNacimiento" integer NOT NULL,
    "documentoIdentidad" integer NOT NULL,
    "idTipoDocumento" integer NOT NULL,
    "idPaisResidencia" integer,
    CONSTRAINT "Personas_pkey" PRIMARY KEY ("idPersona"),
    CONSTRAINT "Personas_documentoIdentidad_key" UNIQUE ("documentoIdentidad"),
    CONSTRAINT "Personas_email_key" UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS public."Pruebas"
(
    "idPrueba" integer NOT NULL,
    nombre varchar(300) NOT NULL,
    distancia integer NOT NULL,
    "idEstilo" integer NOT NULL,
    CONSTRAINT "Pruebas_pkey" PRIMARY KEY ("idPrueba")
);

CREATE TABLE IF NOT EXISTS public."Series"
(
    "idSerie" integer NOT NULL,
    "idEvento" integer NOT NULL,
    CONSTRAINT "Series_pkey" PRIMARY KEY ("idSerie")
);

CREATE TABLE IF NOT EXISTS public."tipoDeDocumentoDeIdentidad"
(
    "idTDI" integer NOT NULL,
    nombre varchar(50) NOT NULL,
    CONSTRAINT "tipoDeDocumentoDeIdentidad_pkey" PRIMARY KEY ("idTDI")
);

ALTER TABLE IF EXISTS public."Ciudades"
    ADD CONSTRAINT "Ciudades_idPais_fkey" FOREIGN KEY ("idPais")
    REFERENCES public."Paises" ("idPais");

ALTER TABLE IF EXISTS public."Ciudades"
    ADD CONSTRAINT "Ciudades_idPais_fkey1" FOREIGN KEY ("idPais")
    REFERENCES public."Paises" ("idPais");

ALTER TABLE IF EXISTS public."Clubes"
    ADD CONSTRAINT "Clubes_idCiudadSede_fkey" FOREIGN KEY ("idCiudadSede")
    REFERENCES public."Ciudades" ("idCiudad");

ALTER TABLE IF EXISTS public."Clubes"
    ADD CONSTRAINT "Clubes_idCiudadSede_fkey1" FOREIGN KEY ("idCiudadSede")
    REFERENCES public."Ciudades" ("idCiudad");

ALTER TABLE IF EXISTS public."CompetidoresEnSeries"
    ADD CONSTRAINT "CompetidoresEnSeries_idPersona_fkey" FOREIGN KEY ("idPersona")
    REFERENCES public."Personas" ("idPersona");

ALTER TABLE IF EXISTS public."CompetidoresEnSeries"
    ADD CONSTRAINT "CompetidoresEnSeries_idPersona_fkey1" FOREIGN KEY ("idPersona")
    REFERENCES public."Deportistas" ("idPersona");

ALTER TABLE IF EXISTS public."CompetidoresEnSeries"
    ADD CONSTRAINT "CompetidoresEnSeries_idSerie_fkey" FOREIGN KEY ("idSerie")
    REFERENCES public."Series" ("idSerie");

ALTER TABLE IF EXISTS public."CompetidoresEnSeries"
    ADD CONSTRAINT "CompetidoresEnSeries_idSerie_fkey1" FOREIGN KEY ("idSerie")
    REFERENCES public."Series" ("idSerie");

ALTER TABLE IF EXISTS public."Deportistas"
    ADD CONSTRAINT "Deportistas_idCategoriaEdad_fkey" FOREIGN KEY ("idCategoriaEdad")
    REFERENCES public."CategoriasEdad" ("idCategoriaEdad");

ALTER TABLE IF EXISTS public."Deportistas"
    ADD CONSTRAINT "Deportistas_idCategoriaEdad_fkey1" FOREIGN KEY ("idCategoriaEdad")
    REFERENCES public."CategoriasEdad" ("idCategoriaEdad");

ALTER TABLE IF EXISTS public."Deportistas"
    ADD CONSTRAINT "Deportistas_idClub_fkey" FOREIGN KEY ("idClub")
    REFERENCES public."Clubes" ("idClub");

ALTER TABLE IF EXISTS public."Deportistas"
    ADD CONSTRAINT "Deportistas_idClub_fkey1" FOREIGN KEY ("idClub")
    REFERENCES public."Clubes" ("idClub");

ALTER TABLE IF EXISTS public."Deportistas"
    ADD CONSTRAINT "Deportistas_idEstiloPrincipal_fkey" FOREIGN KEY ("idEstiloPrincipal")
    REFERENCES public."Estilos" ("idEstilo");

ALTER TABLE IF EXISTS public."Deportistas"
    ADD CONSTRAINT "Deportistas_idEstiloPrincipal_fkey1" FOREIGN KEY ("idEstiloPrincipal")
    REFERENCES public."Estilos" ("idEstilo");

ALTER TABLE IF EXISTS public."Deportistas"
    ADD CONSTRAINT "Deportistas_idPersona_fkey" FOREIGN KEY ("idPersona")
    REFERENCES public."Personas" ("idPersona");

ALTER TABLE IF EXISTS public."Deportistas"
    ADD CONSTRAINT "Deportistas_idPersona_fkey1" FOREIGN KEY ("idPersona")
    REFERENCES public."Personas" ("idPersona");

ALTER TABLE IF EXISTS public."Directivos"
    ADD CONSTRAINT "Directivos_idCargo_fkey" FOREIGN KEY ("idCargo")
    REFERENCES public."Cargos" ("idCargo");

ALTER TABLE IF EXISTS public."Directivos"
    ADD CONSTRAINT "Directivos_idCargo_fkey1" FOREIGN KEY ("idCargo")
    REFERENCES public."Cargos" ("idCargo");

ALTER TABLE IF EXISTS public."Directivos"
    ADD CONSTRAINT "Directivos_idClub_fkey" FOREIGN KEY ("idClub")
    REFERENCES public."Clubes" ("idClub");

ALTER TABLE IF EXISTS public."Directivos"
    ADD CONSTRAINT "Directivos_idClub_fkey1" FOREIGN KEY ("idClub")
    REFERENCES public."Clubes" ("idClub");


ALTER TABLE IF EXISTS public."Directivos"
    ADD CONSTRAINT "Directivos_idPersona_fkey" FOREIGN KEY ("idPersona")
    REFERENCES public."Personas" ("idPersona");

ALTER TABLE IF EXISTS public."Directivos"
    ADD CONSTRAINT "Directivos_idPersona_fkey1" FOREIGN KEY ("idPersona")
    REFERENCES public."Personas" ("idPersona");

ALTER TABLE IF EXISTS public."Entrenadores"
    ADD CONSTRAINT "Entrenadores_idClub_fkey" FOREIGN KEY ("idClub")
    REFERENCES public."Clubes" ("idClub");


ALTER TABLE IF EXISTS public."Entrenadores"
    ADD CONSTRAINT "Entrenadores_idClub_fkey1" FOREIGN KEY ("idClub")
    REFERENCES public."Clubes" ("idClub");


ALTER TABLE IF EXISTS public."Entrenadores"
    ADD CONSTRAINT "Entrenadores_idPersona_fkey" FOREIGN KEY ("idPersona")
    REFERENCES public."Personas" ("idPersona");


ALTER TABLE IF EXISTS public."Entrenadores"
    ADD CONSTRAINT "Entrenadores_idPersona_fkey1" FOREIGN KEY ("idPersona")
    REFERENCES public."Personas" ("idPersona");


ALTER TABLE IF EXISTS public."Eventos"
    ADD CONSTRAINT "Eventos_idJornada_fkey" FOREIGN KEY ("idJornada")
    REFERENCES public."Jornadas" ("idJornada");


ALTER TABLE IF EXISTS public."Eventos"
    ADD CONSTRAINT "Eventos_idJornada_fkey1" FOREIGN KEY ("idJornada")
    REFERENCES public."Jornadas" ("idJornada");


ALTER TABLE IF EXISTS public."Eventos"
    ADD FOREIGN KEY ("idEvento")
    REFERENCES public."Pruebas" ("idPrueba");


ALTER TABLE IF EXISTS public."Inscripciones"
    ADD CONSTRAINT "Inscripciones_idPersona_fkey" FOREIGN KEY ("idPersona")
    REFERENCES public."Personas" ("idPersona");


ALTER TABLE IF EXISTS public."Inscripciones"
    ADD CONSTRAINT "Inscripciones_idPersona_fkey1" FOREIGN KEY ("idPersona")
    REFERENCES public."Deportistas" ("idPersona");


ALTER TABLE IF EXISTS public."Inscripciones"
    ADD CONSTRAINT "Inscripciones_idPrueba_fkey" FOREIGN KEY ("idPrueba")
    REFERENCES public."Pruebas" ("idPrueba");


ALTER TABLE IF EXISTS public."Inscripciones"
    ADD CONSTRAINT "Inscripciones_idPrueba_fkey1" FOREIGN KEY ("idPrueba")
    REFERENCES public."Pruebas" ("idPrueba");


ALTER TABLE IF EXISTS public."Personas"
    ADD CONSTRAINT "Personas_idCuidadNacimiento_fkey" FOREIGN KEY ("idCuidadNacimiento")
    REFERENCES public."Ciudades" ("idCiudad");


ALTER TABLE IF EXISTS public."Personas"
    ADD CONSTRAINT "Personas_idCuidadNacimiento_fkey1" FOREIGN KEY ("idCuidadNacimiento")
    REFERENCES public."Ciudades" ("idCiudad");


ALTER TABLE IF EXISTS public."Personas"
    ADD CONSTRAINT "Personas_idPaisResidencia_fkey" FOREIGN KEY ("idPaisResidencia")
    REFERENCES public."Paises" ("idPais");


ALTER TABLE IF EXISTS public."Personas"
    ADD CONSTRAINT "Personas_idPaisResidencia_fkey1" FOREIGN KEY ("idPaisResidencia")
    REFERENCES public."Paises" ("idPais");


ALTER TABLE IF EXISTS public."Personas"
    ADD CONSTRAINT "Personas_idTipoDocumento_fkey" FOREIGN KEY ("idTipoDocumento")
    REFERENCES public."tipoDeDocumentoDeIdentidad" ("idTDI");


ALTER TABLE IF EXISTS public."Personas"
    ADD CONSTRAINT "Personas_idTipoDocumento_fkey1" FOREIGN KEY ("idTipoDocumento")
    REFERENCES public."tipoDeDocumentoDeIdentidad" ("idTDI");


ALTER TABLE IF EXISTS public."Pruebas"
    ADD CONSTRAINT "Pruebas_idEstilo_fkey" FOREIGN KEY ("idEstilo")
    REFERENCES public."Estilos" ("idEstilo");


ALTER TABLE IF EXISTS public."Pruebas"
    ADD CONSTRAINT "Pruebas_idEstilo_fkey1" FOREIGN KEY ("idEstilo")
    REFERENCES public."Estilos" ("idEstilo");


ALTER TABLE IF EXISTS public."Series"
    ADD CONSTRAINT "Series_idEvento_fkey" FOREIGN KEY ("idEvento")
    REFERENCES public."Eventos" ("idEvento");


ALTER TABLE IF EXISTS public."Series"
    ADD CONSTRAINT "Series_idEvento_fkey1" FOREIGN KEY ("idEvento")
    REFERENCES public."Eventos" ("idEvento");