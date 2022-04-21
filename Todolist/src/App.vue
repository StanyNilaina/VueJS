<template background-color="cyan darken-2">
  <v-container >
    <v-sheet elevation="6">
    <v-tabs background-color="teal" dark show-arrows >
      <v-tabs-slider color="yellow"></v-tabs-slider>
      <v-tab>
        <router-link to="/" class="">TodoList</router-link>
      </v-tab>
      <v-tab>
        Task 2
      </v-tab>
    </v-tabs>
  </v-sheet>
    <router-view></router-view>
  </v-container>
  
</template>

<script>
export default {
  name: 'App',

  components: {
  },

  data: () => ({
    //
  }),
}
</script>
<style>
 
</style>
