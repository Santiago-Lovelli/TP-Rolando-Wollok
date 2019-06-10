/*══════════╣Entrega numero 1╠══════════*/
/* *══════════╣Respuesta punto 3: Lucha y hechicería avanzada╠══════════
 /*Si el libro de hechizos se contiene a si mismo ocurre un error de evaluacion de linea, debido a que
  *entraria en un lup donde para saber el poder necesita saber si es podoroso lo que necesita saber su poder*/

/*══════════╣Entrega numero 2╠══════════*/
/* ══════════╣Respuesta Punto 3: Lucha y hechicería más avanzada aún╠══════════*/
/* Que haya mas de un espejo es innecesario, ya que da un valor de lucha para el personaje que lo llame,
 * por que depende del personaje que le mande el mensaje, no de a quien pertenesca, ni tampoco posee variables
 *  modificables. En caso contrario, si un personaje posee dos espejos se entra en un ciclo donde cada espejo espera
 el resultado del otro para calcular el valor de lucha que aumenta*/
/*Que haya mas de un libro de hechizos es conveniente ya que puede ocurrir que un personaje no pueda hacer algun 
 * hechizo en especifico. Ahora que un libro de hechizos tenga a otro entre sus hechizos es posible,
 mientras no sea el mismo, ya que sino ocurrira lo que pasaba en la entrega anterior*/
 
 /*══════════╣Correccion de entrega numero 2╠══════════*/
 /* responsabilidad del espejo saber cual es el artefacto más poderoso de un personaje? Es responsabilidad del personaje? 
  * Si, ya que el lo necesita para definirse a si mismo, no el personaje. Lo que si es responsabilidad del personaje es conocer su lista de artefactos.
  * Podría ser responsabilidad de alguien más? Por como estan definidos los requerimientos no, pero si lo neceta como el espejo si. En cuyo caso podria
  * pasar a ser un metodo de alguna super clase del espejo y ese alguien*/