<template>
  <div class="home">
    <v-container class="ma-0 pa-0" grid-list-sm>
      <v-card-title>Welcome to Fiji Travel Apps</v-card-title>
      <!-- <v-card-title class="subtitle-1">Adetiya Bagus Nusantara</v-card-title> -->
    </v-container>
    <v-row>
      <v-spacer></v-spacer>
    </v-row>
      <template>
        <v-toolbar dark prominent src="https://pennysaveramp.com/wp-content/uploads/2019/07/O56BMVGZKVCK3HLLZV37JETNSE.jpg" height="300px">
        <v-container fluid>
          <v-row>
            <br><br><br><br>
          </v-row>
          <v-row class="text-center">
            <v-col cols="4">
              <v-btn icon to="/flights">
                <v-avatar color="indigo" height="100px" width="100">
                  <v-icon large dark>mdi-airplane</v-icon>
                </v-avatar>
              </v-btn>
              <br><br>
              <v-list-item-title class="tittle">Flights</v-list-item-title>
            </v-col>
            <v-col cols="4">
              <v-btn icon to="/flights">
                <v-avatar color="red" height="100px" width="100">
                  <v-icon large>mdi-hotel</v-icon>
                </v-avatar>
              </v-btn>
              <br><br>
              <v-list-item-title class="tittle">Hotels</v-list-item-title>
            </v-col>
            <v-col cols="4">
              <v-btn icon to="/flights">
                <v-avatar color="green" height="100px" width="100">
                  <v-icon large dark>mdi-bus</v-icon>
                </v-avatar>
              </v-btn>
              <br><br>
              <v-list-item-title class="tittle">Bus</v-list-item-title>
            </v-col>
            
          </v-row>
        </v-container>
        </v-toolbar>
      </template>

    <!-- template categries -->
    <v-container class="ma-0 pa-0" grid-list-sm>
      <v-card-title>Top Destinations</v-card-title>
      <v-card-title class="subtitle-1">Enjoy our special offers</v-card-title>
      <div class="text-right">
        <v-btn small text to="/promos" class="blue--text">
          Show All
          <v-icon>mdi-chevron-right</v-icon>
        </v-btn>
      </div>
      <v-layout wrap>
        <v-flex v-for="(category) in categories" :key="`category-`+category.id" xs6>
          <v-card :to="'/category/'+ category.slug">
            <v-img :src="'http://travel-backend.local/images/categories/'+category.image" class="white--text">
              <v-card-title class="fill-height align-end" v-text="category.name"></v-card-title>
              <v-card-subtitle class="fill-height align-end" v-text="category.name"></v-card-subtitle>
            </v-img>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
    <!-- template books -->
  </div>
</template>

<script>
// @ is an alias to /src
// import HelloWorld from "@/components/HelloWorld.vue";

export default {
  name: "home",
  data: () => ({
    categories: []
  }),
  created() {
    console.log('get data categories')
    this.axios.get("/categories/random/2")
      .then(response => {
        let { data } = response.data
        this.categories = data
      })
      .catch(error => {
        let { response } = error
        console.log(response);
      });
  },
  mounted(){
    //console.log(process.env)
  }
  // components: {
  //   HelloWorld
  // }
};
</script>

