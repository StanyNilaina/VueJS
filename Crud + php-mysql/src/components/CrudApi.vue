<template>
    <v-container>
        <h1>Ici pour apprendre la <br> Consommation d'un <u>API Rest</u></h1>
        <v-row>
          <v-col cols="6" class="my-3">
            <h3><u>Les listes des utilisateurs</u></h3>
            <v-container v-if="info == undifined">
              <h1>Vous n'êtes pas connecté au serveur ! :(</h1>
            </v-container>
            <v-container style="height:400px; overflow:scroll;" v-if="info != undifined">
               <v-jumbotron v-for="item in info" :key="item.id" > 
                 <v-container fill-height justify-center>
                   <v-layout align-center >
                     <v-avatar icon color="grey">
                       <v-icon>mdi-face-recognition</v-icon>
                     </v-avatar>
                     <v-flex class="mx-5">
                       <h3 class="display-3">{{item['name']}}</h3>
                       <span class="subheading">{{item['email']}}</span>
                     </v-flex>
                     <v-btn flat border="2" class="mx-5" right="5" position="absolute" @click="editpers(item)" :disabled="!editshow">
                        <v-icon>mdi-account-edit-outline</v-icon>
                       </v-btn>
                   </v-layout>
                   <v-divider class="my-3">
                   </v-divider>
                 </v-container>
                 
               </v-jumbotron>
            </v-container>
          </v-col>
          <v-col cols="6">
            <h3>Admin User</h3>
            <v-container>
               <v-card>
                <v-btn block color="brown" @click="showform">
                  Ajouter une personne 
                  <v-icon right="5">mdi-account-plus</v-icon> 
                  <v-icon right="5" v-if="addshow == false">mdi-chevron-down-circle</v-icon>
                  <v-icon right="5" v-if="addshow == true">mdi-chevron-up-circle</v-icon>
                </v-btn>
              </v-card>
                <v-card v-show="addshow">
                  <v-container >
                    <v-form>
                      <v-text-field name="name" label="Nom" clearable v-model="olona.name"></v-text-field>
                      <v-text-field name="email" label="Email" clearable v-model="olona.email"></v-text-field>
                      <v-btn block color="success" dark @click="ajouter()">Ajouter <v-icon right="5">mdi-account-plus</v-icon> </v-btn>
                    </v-form>
                  </v-container>            
                </v-card>
            </v-container>
            <v-container>
               <v-card>
                <v-btn block color="brown" @click="showedit">
                  Editer une personne 
                  <v-icon right="5">mdi-account-edit-outline</v-icon> 
                  <v-icon right="5" v-if="editshow == false">mdi-chevron-down-circle</v-icon>
                  <v-icon right="5" v-if="editshow == true">mdi-chevron-up-circle</v-icon>
                </v-btn>
              </v-card>
                <v-card v-show="editshow">
                  <v-container>
                    <v-form>
                      <v-text-field name="name1" label="Nom" clearable v-model="olona.name"></v-text-field>
                      <v-text-field name="email1" label="Email" clearable v-model="olona.email"></v-text-field>
                    </v-form>
                      <v-btn color="success" @click="savedit()" min-width="85%">
                        Mettre à jour 
                        <v-icon>mdi-content-save-check-outline</v-icon>
                      </v-btn>
                      <v-btn color="error" @click="trash(olona)"><v-icon>mdi-trash-can-outline</v-icon></v-btn>
                  </v-container>
                </v-card>
            </v-container>
          </v-col>
        </v-row>
    </v-container>   
</template>
<script>
import axios from 'axios';
export default {
    name: 'CrudApi',

  data: () => ({
    info: null,
		link : 'http://localhost:8089/API_Rest/', 
    olona: {id:"",name:"", email:""},
    addshow : false,
    editshow: false
  }),
  mounted() {
    axios
      .get(this.link)
      //.get(this.link+"?id="+this.id)
      .then((response) => {this.info = response.data});
  },
  methods: {
    showform(){
      this.addshow = !this.addshow;
      this.editshow = false;
    },
    showedit(){
      this.editshow = !this.editshow;
      this.addshow= false;
    },
    ajouter(){
      this.olona.id = +this.info[this.info.length-1].id +1;
      try {
        axios.post(this.link,this.olona);
        this.olona.nom="";
        this.olona.email="";
      } catch (error) {
        console.log("erreur :".error);
      }
    },
    editpers(editedolona){
      this.olona = editedolona;
    },
    savedit(){
      try {
          axios
          .put(this.link+"?id="+this.olona.id, this.olona, {headers: {'Content-Type': 'application/x-www-form-urlencode; charset=UTF-8'} })
          this.olona.nom="";
          this.olona.email="";
      } catch (error) {
        console.log("erreur".error);
      }
    },
    trash(pers){
     try {
       axios.delete(this.link,{ data: {id: pers.id} ,headers: {'Authorization': '***'} });
       this.editshow = false;
     } catch (error) {
       console.log("erreur".error);
     }
    }
  }
}
</script>