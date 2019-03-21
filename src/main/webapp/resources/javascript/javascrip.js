/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function mostra(x){ 
                //varibili di cliente
                var nome1;
                var nome2;
                var nome3;
                var codice_fiscale;
                var indirizzo;
                var citta;
                var provincia;
                var telefono;
                var fax;
                var email;
                var cap; 
                var messaggio="";
                
                //variabili di articolo
                var id;
                var azienda_produttrice;
                var nome_prodotto;
                var informazione_prodotto;
                var costo;
                var msg;
                
                if (x.childNodes.length==11){
                    for(var i=0;i<11;i++){
                        if(i==0){                        
                            nome1=x.childNodes[i].textContent;
                            document.getElementById('idNome1').value=nome1;

                        }
                        if(i==1){                        
                            nome2=x.childNodes[i].textContent;
                            document.getElementById('idNome2').value=nome2;
                        } 
                        if(i==2){                        
                            nome3=x.childNodes[i].textContent;
                            document.getElementById('idNome3').value=nome3;
                        }
                        if(i==3){                        
                            codice_fiscale=x.childNodes[i].textContent;
                            document.getElementById('idCodice_fiscale').value=codice_fiscale;
                            //window.alert(partita_iva);
                        }
                        if(i==4){                        
                            indirizzo=x.childNodes[i].textContent;
                            document.getElementById('idIndirizzo').value=indirizzo;
                            //window.alert(partita_iva);
                        }
                        if(i==5){                        
                            citta=x.childNodes[i].textContent;
                            document.getElementById('idCitta').value=citta;
                            //window.alert(partita_iva);
                        }
                        if(i==6){                        
                            provincia=x.childNodes[i].textContent;
                            document.getElementById('idProvincia').value=provincia;
                            //window.alert(partita_iva);
                        }
                        if(i==7){                        
                            telefono=x.childNodes[i].textContent;
                            document.getElementById('idTelefono').value=telefono;
                            //window.alert(partita_iva);
                        }
                        if(i==8){                        
                            fax=x.childNodes[i].textContent;
                            document.getElementById('idFax').value=fax;
                            //window.alert(partita_iva);
                        }
                        if(i==9){                        
                            email=x.childNodes[i].textContent;
                            document.getElementById('idEmail').value=email;
                            //window.alert(partita_iva);
                        }
                        if(i==10){                        
                            cap=x.childNodes[i].textContent;
                            document.getElementById('idCap').value=cap;
                            //window.alert(partita_iva);
                        }

                        messaggio += " - " + x.childNodes[i].textContent;
                        msg=messaggio;

                    }                  
                    document.getElementById('etichetta').innerHTML=msg;
                    //esegui solo se un bottone conferma non esiste già
                    if(document.getElementById('idConferma')==null){
                        var nodo = document.getElementById("bottoni");
                        //crea il bottone conferma
                        var conferma = document.createElement("input");
                        conferma.setAttribute("type", "submit");
                        conferma.setAttribute("name", "conferma");
                        conferma.setAttribute("value", "conferma");
                        conferma.setAttribute("class", "bottone");
                        conferma.setAttribute("id", "idConferma");
                        conferma.setAttribute("onClick", "scrivi()");
                        nodo.appendChild(conferma);                 
                    }
                }
                if (x.childNodes.length==5){
                     messaggio="";
                    for( i=0;i<5;i++){
                        if(i==0){                        
                            id=x.childNodes[i].textContent;
                            document.getElementById('idID').value=id;
                        }
                        if(i==1){                        
                            azienda_produttrice=x.childNodes[i].textContent;
                            document.getElementById('idAzienda_produttrice').value=azienda_produttrice;
                        }
                        if(i==2){                        
                            nome_prodotto=x.childNodes[i].textContent;
                            document.getElementById('idNome_prodotto').value=nome_prodotto;
                        }
                        if(i==3){                        
                            informazione_prodotto=x.childNodes[i].textContent;
                            document.getElementById('idInformazione_prodotto').value=informazione_prodotto;
                        }
                        if(i==4){                        
                            costo=x.childNodes[i].textContent;
                            document.getElementById('idCosto').value=costo;
                        }
                        messaggio += " " + x.childNodes[i].textContent;
                        msg=messaggio;

                    }                  
                    document.getElementById('etichetta').innerHTML=msg;
                    //esegui solo se un bottone conferma non esiste già
                    if(document.getElementById('idConferma')==null){
                        var nodo = document.getElementById("bottoni");
                        //crea il bottone conferma
                        var conferma = document.createElement("input");
                        conferma.setAttribute("type", "submit");
                        conferma.setAttribute("name", "conferma");
                        conferma.setAttribute("value", "conferma");
                        conferma.setAttribute("class", "bottone");
                        conferma.setAttribute("id", "idConferma");
                        conferma.setAttribute("onClick", "scrivi()");
                        nodo.appendChild(conferma);                 
                    }

                }
        }
        
