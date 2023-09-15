BEGIN;


CREATE TABLE IF NOT EXISTS public."Usuarios"
(
    "idUsuario" serial,
    nombres character varying(50) NOT NULL,
    apellidos character varying(50) NOT NULL,
    "correoElectronico" character varying(100) NOT NULL,
    "contraseña" character varying(255) NOT NULL,
    telefono character varying(10),
    "nombreUsuario" character varying(128),
    PRIMARY KEY ("idUsuario"),
    CONSTRAINT "correoUnico" UNIQUE ("correoElectronico")
);

CREATE TABLE IF NOT EXISTS public."Autores"
(
    "idAutor" serial,
    nombres character varying(100) NOT NULL,
    apellidos character varying(100) NOT NULL,
    portada character varying(512),
    descripcion character varying(512),
    PRIMARY KEY ("idAutor")
);

CREATE TABLE IF NOT EXISTS public."Escritores"
(
    "idAutor" integer,
    PRIMARY KEY ("idAutor")
);

CREATE TABLE IF NOT EXISTS public."Articulos"
(
    "idArticulo" serial,
    "idAutor" integer NOT NULL,
    cuerpo character varying(4096) NOT NULL,
    subtitulo character varying(256) NOT NULL,
    portada character varying,
    exclusividad character varying,
    PRIMARY KEY ("idArticulo")
);

CREATE TABLE IF NOT EXISTS public."Redacciones"
(
    "idAutor" integer,
    nombre character varying NOT NULL,
    PRIMARY KEY ("idAutor")
);

CREATE TABLE IF NOT EXISTS public."Secciones"
(
    "idSeccion" serial,
    nombre character varying NOT NULL,
    PRIMARY KEY ("idSeccion")
);

CREATE TABLE IF NOT EXISTS public."SubSecciones"
(
    "idSubSeccion" serial,
    nombre character varying NOT NULL,
    descripcion character varying,
    "idSeccion" integer NOT NULL,
    PRIMARY KEY ("idSubSeccion")
);

CREATE TABLE IF NOT EXISTS public."UsuarioSubsecciones"
(
    "idUsuario" integer,
    "idSubSeccion" integer,
    PRIMARY KEY ("idUsuario", "idSubSeccion")
);

CREATE TABLE IF NOT EXISTS public."Etiquetas"
(
    "idEtiqueta" serial,
    nombre character varying NOT NULL,
    descripcion character varying,
    PRIMARY KEY ("idEtiqueta")
);

CREATE TABLE IF NOT EXISTS public."EtiquetasDeArticulos"
(
    "idArticulo" integer,
    "idEtiqueta" integer,
    PRIMARY KEY ("idArticulo", "idEtiqueta")
);

CREATE TABLE IF NOT EXISTS public."TiposDePlanes"
(
    "idTipoDePlan" serial,
    nombre character varying NOT NULL,
    PRIMARY KEY ("idTipoDePlan")
);

CREATE TABLE IF NOT EXISTS public."Planes"
(
    "idPlan" serial,
    precio numeric NOT NULL,
    descripcion character varying,
    "idTipo" integer NOT NULL,
    "duracionEnDias" integer NOT NULL,
    PRIMARY KEY ("idPlan")
);

CREATE TABLE IF NOT EXISTS public."Suscripciones"
(
    "idSuscripcion" serial,
    "fechaInicio" date NOT NULL,
    "idPlan" integer NOT NULL,
    "idUsuario" integer NOT NULL,
    PRIMARY KEY ("idSuscripcion")
);

CREATE TABLE IF NOT EXISTS public."tiposRedesSociales"
(
    "idTipo" serial,
    nombre character varying NOT NULL,
    PRIMARY KEY ("idTipo")
);

CREATE TABLE IF NOT EXISTS public."RedesSociales"
(
    "idRedSocial" serial,
    "idTipo" integer NOT NULL,
    enlace character varying NOT NULL,
    PRIMARY KEY ("idRedSocial")
);

CREATE TABLE IF NOT EXISTS public."CategoriasDeBlogs"
(
    "idCategoria" serial,
    nombre character varying NOT NULL,
    PRIMARY KEY ("idCategoria")
);

CREATE TABLE IF NOT EXISTS public."Blogueros"
(
    "idBloguero" serial,
    "nombreCompleto" character varying NOT NULL,
    descripcion character varying,
    "idRedSocial" integer NOT NULL,
    PRIMARY KEY ("idBloguero")
);

CREATE TABLE IF NOT EXISTS public."Blogs"
(
    "idBlog" serial,
    titulo character varying NOT NULL,
    "idBloguero" integer NOT NULL,
    PRIMARY KEY ("idBlog")
);

CREATE TABLE IF NOT EXISTS public."BlogDeUsuarios"
(
    "idBlog" integer NOT NULL,
    "idUsuario" integer NOT NULL,
    PRIMARY KEY ("idBlog", "idUsuario")
);

CREATE TABLE IF NOT EXISTS public."Carituristas"
(
    "idCariturista" serial,
    nombre character varying NOT NULL,
    descripcion character varying,
    portada character varying NOT NULL,
    pseudonimo character varying,
    "idRedSocial" integer NOT NULL,
    PRIMARY KEY ("idCariturista")
);

CREATE TABLE IF NOT EXISTS public."Contenidos"
(
    "idContenido" serial,
    titulo character varying NOT NULL,
    "fechaPublicacion" date NOT NULL,
    PRIMARY KEY ("idContenido")
);

CREATE TABLE IF NOT EXISTS public."Caricaturas"
(
    "idContenido" integer,
    imagen character varying NOT NULL,
    "idCaricaturista" integer NOT NULL,
    PRIMARY KEY ("idContenido")
);

CREATE TABLE IF NOT EXISTS public."ActualizacionesDeBlogs"
(
    "idContenido" integer,
    cuerpo character varying NOT NULL,
    visualizaciones integer NOT NULL,
    "idCategoria" integer NOT NULL,
    "idBlog" integer NOT NULL,
    PRIMARY KEY ("idContenido")
);

CREATE TABLE IF NOT EXISTS public."Galerias"
(
    "idGaleria" integer,
    autor character varying NOT NULL,
    portada character varying NOT NULL,
    PRIMARY KEY ("idGaleria")
);

CREATE TABLE IF NOT EXISTS public."Historias"
(
    "idHistoria" serial,
    "idGaleria" integer NOT NULL,
    imagen character varying NOT NULL,
    cuerpo character varying,
    PRIMARY KEY ("idHistoria")
);

CREATE TABLE IF NOT EXISTS public."Podcasts"
(
    "idPodcast" serial,
    titulo character varying NOT NULL,
    portada character varying NOT NULL,
    PRIMARY KEY ("idPodcast")
);

CREATE TABLE IF NOT EXISTS public."EpisodiosPodcasts"
(
    "idArticulo" integer,
    "idPodcast" integer NOT NULL,
    PRIMARY KEY ("idArticulo")
);

CREATE TABLE IF NOT EXISTS public."PodcastsUsuarios"
(
    "idUsuario" integer,
    "idPodcast" integer,
    PRIMARY KEY ("idUsuario", "idPodcast")
);

CREATE TABLE IF NOT EXISTS public."TemasDelDia"
(
    "idTemasDelDia" serial,
    nombre character varying NOT NULL,
    PRIMARY KEY ("idTemasDelDia")
);

CREATE TABLE IF NOT EXISTS public."Noticias"
(
    "idArticulo" integer,
    "idTemaDelDia" integer NOT NULL,
    PRIMARY KEY ("idArticulo")
);

CREATE TABLE IF NOT EXISTS public."Comentarios"
(
    "idComentario" serial,
    cuerpo character varying NOT NULL,
    "fechaPublicacion" date NOT NULL,
    "idUsuario" integer NOT NULL,
    PRIMARY KEY ("idComentario")
);

CREATE TABLE IF NOT EXISTS public."ComentariosBlogs"
(
    "idComentario" integer,
    "idContenido" integer NOT NULL,
    PRIMARY KEY ("idComentario")
);

CREATE TABLE IF NOT EXISTS public."ComentariosArticulos"
(
    "idComentario" integer,
    PRIMARY KEY ("idComentario")
);

CREATE TABLE IF NOT EXISTS public."ComentariosPrincipales"
(
    "idComentario" integer,
    PRIMARY KEY ("idComentario")
);

CREATE TABLE IF NOT EXISTS public."ComentariosSecundarios"
(
    "idComentario" integer,
    "idComentarioPrincipal" integer NOT NULL,
    PRIMARY KEY ("idComentario")
);

CREATE TABLE IF NOT EXISTS public."Votos"
(
    "idVoto" serial,
    "idUsuario" integer NOT NULL,
    "idComentario" integer NOT NULL,
    voto boolean NOT NULL,
    PRIMARY KEY ("idVoto")
);

CREATE TABLE IF NOT EXISTS public."Juegos"
(
    "idJuego" serial,
    logo character varying NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying,
    PRIMARY KEY ("idJuego")
);

CREATE TABLE IF NOT EXISTS public."ActualizacionesJuegos"
(
    "idActualización" serial,
    enlace character varying NOT NULL,
    "idJuego" integer NOT NULL,
    PRIMARY KEY ("idActualización")
);

CREATE TABLE IF NOT EXISTS public."TiposDeCondolencias"
(
    "idTipo" serial,
    nombre character varying NOT NULL,
    PRIMARY KEY ("idTipo")
);

CREATE TABLE IF NOT EXISTS public."Obituarios"
(
    "idObituario" serial,
    nombres character varying NOT NULL,
    apellidos character varying NOT NULL,
    titulo character varying NOT NULL,
    comentario character varying NOT NULL,
    fecha date NOT NULL,
    lugar character varying NOT NULL,
    autores character varying NOT NULL,
    cuerpo character varying NOT NULL,
    "idTipo" integer NOT NULL,
    PRIMARY KEY ("idObituario")
);

ALTER TABLE IF EXISTS public."Escritores"
    ADD CONSTRAINT "AutorFK" FOREIGN KEY ("idAutor")
    REFERENCES public."Autores" ("idAutor") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Articulos"
    ADD CONSTRAINT "AutorFk" FOREIGN KEY ("idAutor")
    REFERENCES public."Escritores" ("idAutor") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Articulos"
    ADD CONSTRAINT contenidofk FOREIGN KEY ("idArticulo")
    REFERENCES public."Contenidos" ("idContenido") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Redacciones"
    ADD CONSTRAINT "AutorPk" FOREIGN KEY ("idAutor")
    REFERENCES public."Autores" ("idAutor") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."SubSecciones"
    ADD CONSTRAINT "SeccionFk" FOREIGN KEY ("idSeccion")
    REFERENCES public."Secciones" ("idSeccion") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."UsuarioSubsecciones"
    ADD CONSTRAINT "UserFk" FOREIGN KEY ("idUsuario")
    REFERENCES public."Usuarios" ("idUsuario") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."UsuarioSubsecciones"
    ADD CONSTRAINT "SubSeccionFk" FOREIGN KEY ("idSubSeccion")
    REFERENCES public."SubSecciones" ("idSubSeccion") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."EtiquetasDeArticulos"
    ADD CONSTRAINT "EtiquetaFk" FOREIGN KEY ("idEtiqueta")
    REFERENCES public."Etiquetas" ("idEtiqueta") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."EtiquetasDeArticulos"
    ADD CONSTRAINT "ArticuloFk" FOREIGN KEY ("idArticulo")
    REFERENCES public."Articulos" ("idArticulo") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Planes"
    ADD CONSTRAINT "TipoFk" FOREIGN KEY ("idTipo")
    REFERENCES public."TiposDePlanes" ("idTipoDePlan") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Suscripciones"
    ADD CONSTRAINT "PlanFk" FOREIGN KEY ("idPlan")
    REFERENCES public."Planes" ("idPlan") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Suscripciones"
    ADD CONSTRAINT "UsuarioFk" FOREIGN KEY ("idUsuario")
    REFERENCES public."Usuarios" ("idUsuario") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."RedesSociales"
    ADD CONSTRAINT "tipoFK" FOREIGN KEY ("idTipo")
    REFERENCES public."tiposRedesSociales" ("idTipo") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Blogueros"
    ADD CONSTRAINT redsocialfk FOREIGN KEY ("idRedSocial")
    REFERENCES public."RedesSociales" ("idRedSocial") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Blogs"
    ADD CONSTRAINT bloguerofk FOREIGN KEY ("idBloguero")
    REFERENCES public."Blogueros" ("idBloguero") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."BlogDeUsuarios"
    ADD CONSTRAINT blogfk FOREIGN KEY ("idBlog")
    REFERENCES public."Blogs" ("idBlog") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."BlogDeUsuarios"
    ADD CONSTRAINT usuariofk FOREIGN KEY ("idUsuario")
    REFERENCES public."Usuarios" ("idUsuario") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Carituristas"
    ADD CONSTRAINT redsocialfk FOREIGN KEY ("idRedSocial")
    REFERENCES public."RedesSociales" ("idRedSocial") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Caricaturas"
    ADD CONSTRAINT caricaturistafk FOREIGN KEY ("idCaricaturista")
    REFERENCES public."Carituristas" ("idCariturista") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Caricaturas"
    ADD CONSTRAINT contenidofk FOREIGN KEY ("idContenido")
    REFERENCES public."Contenidos" ("idContenido") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ActualizacionesDeBlogs"
    ADD CONSTRAINT contenidofk FOREIGN KEY ("idContenido")
    REFERENCES public."Contenidos" ("idContenido") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ActualizacionesDeBlogs"
    ADD CONSTRAINT categoriafk FOREIGN KEY ("idCategoria")
    REFERENCES public."CategoriasDeBlogs" ("idCategoria") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ActualizacionesDeBlogs"
    ADD CONSTRAINT blogfk FOREIGN KEY ("idBlog")
    REFERENCES public."Blogs" ("idBlog") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Galerias"
    ADD CONSTRAINT contenidofk FOREIGN KEY ("idGaleria")
    REFERENCES public."Contenidos" ("idContenido") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Historias"
    ADD CONSTRAINT galeriafk FOREIGN KEY ("idGaleria")
    REFERENCES public."Galerias" ("idGaleria") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."EpisodiosPodcasts"
    ADD CONSTRAINT articulosfk FOREIGN KEY ("idArticulo")
    REFERENCES public."Articulos" ("idArticulo") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."EpisodiosPodcasts"
    ADD CONSTRAINT podcastfk FOREIGN KEY ("idPodcast")
    REFERENCES public."Podcasts" ("idPodcast") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."PodcastsUsuarios"
    ADD CONSTRAINT usuariofk FOREIGN KEY ("idUsuario")
    REFERENCES public."Usuarios" ("idUsuario") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."PodcastsUsuarios"
    ADD CONSTRAINT podcast FOREIGN KEY ("idPodcast")
    REFERENCES public."Podcasts" ("idPodcast") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Noticias"
    ADD CONSTRAINT articulofk FOREIGN KEY ("idArticulo")
    REFERENCES public."Articulos" ("idArticulo") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Noticias"
    ADD CONSTRAINT temadeldiafk FOREIGN KEY ("idTemaDelDia")
    REFERENCES public."TemasDelDia" ("idTemasDelDia") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Comentarios"
    ADD CONSTRAINT usuariofk FOREIGN KEY ("idUsuario")
    REFERENCES public."Usuarios" ("idUsuario") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ComentariosBlogs"
    ADD CONSTRAINT comentariofk FOREIGN KEY ("idComentario")
    REFERENCES public."Comentarios" ("idComentario") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ComentariosBlogs"
    ADD CONSTRAINT actualizacionblogfk FOREIGN KEY ("idContenido")
    REFERENCES public."ActualizacionesDeBlogs" ("idContenido") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ComentariosArticulos"
    ADD CONSTRAINT comentariofk FOREIGN KEY ("idComentario")
    REFERENCES public."Comentarios" ("idComentario") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ComentariosPrincipales"
    ADD CONSTRAINT comentariofk FOREIGN KEY ("idComentario")
    REFERENCES public."ComentariosArticulos" ("idComentario") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ComentariosSecundarios"
    ADD CONSTRAINT comentariofk FOREIGN KEY ("idComentario")
    REFERENCES public."ComentariosArticulos" ("idComentario") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ComentariosSecundarios"
    ADD CONSTRAINT comentarioprincipalfk FOREIGN KEY ("idComentarioPrincipal")
    REFERENCES public."ComentariosPrincipales" ("idComentario") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Votos"
    ADD CONSTRAINT usuariofk FOREIGN KEY ("idUsuario")
    REFERENCES public."Usuarios" ("idUsuario") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Votos"
    ADD CONSTRAINT comentariofk FOREIGN KEY ("idComentario")
    REFERENCES public."ComentariosArticulos" ("idComentario") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."ActualizacionesJuegos"
    ADD CONSTRAINT juegofk FOREIGN KEY ("idJuego")
    REFERENCES public."Juegos" ("idJuego") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Obituarios"
    ADD CONSTRAINT tipofk FOREIGN KEY ("idTipo")
    REFERENCES public."TiposDeCondolencias" ("idTipo") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;