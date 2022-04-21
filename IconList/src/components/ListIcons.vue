<template>
  <div>
    <h1>Listes des Icones de Vue js</h1>
    <h2>Avec Material-Design-Icon</h2>
    <h4>Pas la peine de scroller, appuyez sur ctrl+f et recherchez votre icon</h4>
      <v-card color="grey" elevation="7" border="3">
          <v-container grid-list-md>
            <v-row no-gutters >
             <v-col v-for="item in icons" :key="item.id" cols="2" xs="4" border="3">
                       <v-avatar color="black">
                        <span class="icon">
                            <v-icon >{{ item.nom }}</v-icon> 
                        </span>
                    </v-avatar>
                    {{ item.nom }}  
                </v-col>  
             </v-row>     
          </v-container>
      </v-card>  
  </div> 
</template>
<script>
import item from "../assets/icon.json";
export default {
    name: 'IconLIst',
    data: () => ({
        icons : []
    }),
    methods:{
      async loadIcons(){
         return this.icons = await item;
      }
    },
    mounted(){
      this.loadIcons()
    }
  }
</script>