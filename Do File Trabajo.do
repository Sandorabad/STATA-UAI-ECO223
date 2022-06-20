
/*

 _____ _   _ _____ _____ _____ ______  ___   _   _ _____ _____ _____         
|_   _| \ | |_   _|  ___|  __ \| ___ \/ _ \ | \ | |_   _|  ___/  ___|  _     
  | | |  \| | | | | |__ | |  \/| |_/ / /_\ \|  \| | | | | |__ \ `--.  (_)    
  | | | . ` | | | |  __|| | __ |    /|  _  || . ` | | | |  __| `--. \        
 _| |_| |\  | | | | |___| |_\ \| |\ \| | | || |\  | | | | |___/\__/ /  _     
 \___/\_| \_/ \_/ \____/ \____/\_| \_\_| |_/\_| \_/ \_/ \____/\____/  (_)    
                                                                             
                                                                             
 _____                 _               ___  _               _                
/  ___|               | |             / _ \| |             | |               
\ `--.  __ _ _ __   __| | ___  _ __  / /_\ \ |__   __ _  __| |               
 `--. \/ _` | '_ \ / _` |/ _ \| '__| |  _  | '_ \ / _` |/ _` |               
/\__/ / (_| | | | | (_| | (_) | |    | | | | |_) | (_| | (_| |               
\____/ \__,_|_| |_|\__,_|\___/|_|    \_| |_/_.__/ \__,_|\__,_|               
                                                                             
                                                                             
___  ___      _   _              ___                _                        
|  \/  |     | | (_)            / _ \              | |                       
| .  . | __ _| |_ _  __ _ ___  / /_\ \ ___ ___  ___| |_ __ _                 
| |\/| |/ _` | __| |/ _` / __| |  _  |/ __/ _ \/ __| __/ _` |                
| |  | | (_| | |_| | (_| \__ \ | | | | (_| (_) \__ \ || (_| |                
\_|  |_/\__,_|\__|_|\__,_|___/ \_| |_/\___\___/|___/\__\__,_|                
                                                                             
                                                                             
   ___                         _        ______                               
  |_  |                       (_)       | ___ \                              
    | | ___   __ _  __ _ _   _ _ _ __   | |_/ /__  _ __   ___ ___            
    | |/ _ \ / _` |/ _` | | | | | '_ \  |  __/ _ \| '_ \ / __/ _ \           
/\__/ / (_) | (_| | (_| | |_| | | | | | | | | (_) | | | | (_|  __/           
\____/ \___/ \__,_|\__, |\__,_|_|_| |_| \_|  \___/|_| |_|\___\___|           
                      | |                                                    
                      |_|                                                    
 _____                 _        _   _ _ _              _ _                   
/  ___|               (_)      | | | (_) |            | (_)                  
\ `--.  __ _ _ __ ___  _ _ __  | | | |_| |_ __ _  __ _| |_  __ _ _ __   ___  
 `--. \/ _` | '_ ` _ \| | '__| | | | | | __/ _` |/ _` | | |/ _` | '_ \ / _ \ 
/\__/ / (_| | | | | | | | |    \ \_/ / | || (_| | (_| | | | (_| | | | | (_) |
\____/ \__,_|_| |_| |_|_|_|     \___/|_|\__\__,_|\__, |_|_|\__,_|_| |_|\___/ 
                                                  __/ |                      
                                                 |___/                       
 
*/


clear
set dp comma

* Cargamos la base de datos de CASEN_2017
cd "C:\Users\sando\Desktop\Ayudantias Stata\Trabajo Stata"
use "Casen_2017.dta"


/*
*-------------------IDENTIFICAMOS SI ES JEFE DE HOGAR HOMBRE VS LOS DEMAS-------
gen jefe_hogar_hombre = 0
replace jefe_hogar_hombre = 1 if marca == "J" & sexo == 1
*-------------------IDENTIFICAMOS SI ES JEFE DE HOGAR HOMBRE VS LOS DEMAS-------



*----------------------ELIMINAMOS VARIABLES PROBLEMATICAS-----------------------
*Eliminamos el no sabe no responde de la variable v27a
drop if v27a==99

*Eliminamos a los Menores de 12 años
drop if ch1==4

*Eliminamos el no sabe no responde de la variable hacinamiento
drop if hacinamiento == 9

*Eliminamos las varibales No Sabe/No responde de la variable v12
drop if v12 == 9

*Eliminamos las varibales No Sabe/No responde de la variable v24
drop if v24 == 9

*Eliminamos las varibales No Sabe/No responde de la variable v23
drop if v23 == 9
*----------------------ELIMINAMOS VARIABLES PROBLEMATICAS-----------------------



*----------------VARIABLES DE PRECARIEDAD---------------------------------------
generate sin_luz = 0
replace sin_luz = 1 if v24 == 6

generate sin_WC = 0
replace sin_WC = 1 if v23 == 8
replace sin_WC = 1 if v23 == 7

generate casa_sad = 0
replace casa_sad = 1 if v1 == 7
replace casa_sad = 1 if v1 == 10

generate casa_feliz = 0
replace casa_feliz = 1 if v1 == 1
replace casa_feliz = 1 if v1 == 2
replace casa_feliz = 1 if v1 == 3
replace casa_feliz = 1 if v1 == 4
replace casa_feliz = 1 if v1 == 5

generate rural = 0
replace rural = 1 if zona == 1
*----------------VARIABLES DE PRECARIEDAD---------------------------------------



*----------------VARIABLES DUMMY POR REGION-------------------------------------
generate rtarapaca = 0 
replace rtarapaca = 1 if region== 1

generate rantofagasta = 0 
replace rantofagasta = 1 if region==2

generate ratacama = 0 
replace ratacama = 1 if region==3

generate rcoquimbo = 0 
replace rcoquimbo = 1 if region==4

generate rvalparaiso = 0 
replace rvalparaiso = 1 if region==6

generate rlibertador = 0 
replace rlibertador = 1 if region==7

generate rmaule = 0 
replace rmaule = 1 if region==8

generate rbiobio = 0 
replace rbiobio = 1 if region==9

generate raraucania = 0 
replace raraucania = 1 if region==10

generate rlagos = 0 
replace rlagos = 1 if region==11

generate raysen = 0 
replace raysen = 1 if region==12

generate rmagallanes = 0 
replace rmagallanes = 1 if region==13

generate rrios = 0 
replace rrios = 1 if region==14

generate rarica = 0 
replace rarica = 1 if region==15

generate rñuble = 0 
replace rñuble = 1 if region==16
*----------------VARIABLES DUMMY POR REGION-------------------------------------



*----------------EDUCACION PROMEDIO POR HOGAR-----------------------------------
* Creacion de promedio de educacion por hogar/vivienda (definir diferencia)
replace e6a = 1 if e6a == 1
replace e6a = 2 if e6a == 2
replace e6a = 3 if e6a == 3
replace e6a = 4 if e6a == 4
replace e6a = 5 if e6a == 5
replace e6a = 6 if e6a == 6
replace e6a = 7 if e6a == 7
replace e6a = 8 if e6a == 8
replace e6a = 9 if e6a == 9
replace e6a = 10 if e6a == 10
replace e6a = 11 if e6a == 11
replace e6a = 12 if e6a == 12
replace e6a = 13 if e6a == 13
replace e6a = 14 if e6a == 14
replace e6a = 15 if e6a == 15
replace e6a = 16 if e6a == 16
replace e6a = 17 if e6a == 17
* La variable (la fila que contenda dichos valores) No sabe/no responde será eliminada
*replace e6a = 99 if e6a == 99 

* Creamos el promedio
egen prom_educ = mean(e6a), by(id_vivienda)
*----------------EDUCACION PROMEDIO POR HOGAR-----------------------------------



*----------------EXTRANJERO-----------------------------------------------------
* Se deja afuera "Chilena (Exclusiva) y chilena doble nacionalidad"
generate extranjero = 0 
replace extranjero = 1 if r1a==3
*----------------EXTRANJERO-----------------------------------------------------



*----------------INGRESOS PROMEDIO POR HOGAR------------------------------------
* Ingreso promedio por hogar/vivienda
egen prom_ingreso = mean(ytot), by(id_vivienda)
*----------------INGRESOS PROMEDIO POR HOGAR------------------------------------



*---------------------METROS CUADRADOS------------------------------------------
generate M2 = 0

replace M2 = 1 if v12== 1
replace M2 = 2 if v12== 2
replace M2 = 3 if v12== 3
replace M2 = 4 if v12== 4
replace M2 = 5 if v12== 5
replace M2 = 6 if v12== 6
*---------------------METROS CUADRADOS------------------------------------------



*----------------VARIABLE DEPENDIENTE-------------------------------------------
* Ahora crearemos la variable hacinamiento, eliminamos el no sabe no responde
generate hacinamiento_y = 0

replace hacinamiento_y = 1 if hacinamiento== 1
replace hacinamiento_y = 2 if hacinamiento== 2
replace hacinamiento_y = 3 if hacinamiento== 3
replace hacinamiento_y = 4 if hacinamiento== 4
*----------------VARIABLE DEPENDIENTE-------------------------------------------

*/

* REGRESION CON TODAS LAS VARIABLES
regress hacinamiento_y jefe_hogar_hombre sin_luz sin_WC casa_sad casa_feliz rural rtarapaca rantofagasta rcoquimbo rvalparaiso rlibertador rmaule rbiobio raraucania rlagos raysen rmagallanes rrios rarica rñuble prom_educ extranjero prom_ingreso M2 



* REGRESION SIMPLIFICADA (Sin Regiones)
regress hacinamiento_y jefe_hogar_hombre sin_luz sin_WC casa_sad casa_feliz rural prom_educ extranjero prom_ingreso M2


/*


.______       _______   _______ .______       _______     _______. __    ______   .__   __.        
|   _  \     |   ____| /  _____||   _  \     |   ____|   /       ||  |  /  __  \  |  \ |  |        
|  |_)  |    |  |__   |  |  __  |  |_)  |    |  |__     |   (----`|  | |  |  |  | |   \|  |        
|      /     |   __|  |  | |_ | |      /     |   __|     \   \    |  | |  |  |  | |  . `  |        
|  |\  \----.|  |____ |  |__| | |  |\  \----.|  |____.----)   |   |  | |  `--'  | |  |\   |        
| _| `._____||_______| \______| | _| `._____||_______|_______/    |__|  \______/  |__| \__|        
                                                                                                   
.___________. _______ .______      .___  ___.  __  .__   __.      ___       _______       ___      
|           ||   ____||   _  \     |   \/   | |  | |  \ |  |     /   \     |       \     /   \     
`---|  |----`|  |__   |  |_)  |    |  \  /  | |  | |   \|  |    /  ^  \    |  .--.  |   /  ^  \    
    |  |     |   __|  |      /     |  |\/|  | |  | |  . `  |   /  /_\  \   |  |  |  |  /  /_\  \   
    |  |     |  |____ |  |\  \----.|  |  |  | |  | |  |\   |  /  _____  \  |  '--'  | /  _____  \  
    |__|     |_______|| _| `._____||__|  |__| |__| |__| \__| /__/     \__\ |_______/ /__/     \__\ 
                                                                                                   
                                                                                                                                                                                            
*/

