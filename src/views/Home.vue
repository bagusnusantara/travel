<template>
  <div>
    <v-container class="ma-0 pa-0" grid-list-sm>
      <div class="text-right">
        <v-btn small text to="/categories" class="blue--text">
          All Cities <v-icon>mdi-chevron-right</v-icon>
        </v-btn>
      </div> 
      <v-layout wrap>
        <v-flex v-for="(category) in categories" :key="`category-`+category.id" xs6>
          <v-card :to="'/category/'+ category.slug">
            <v-img
              :src="getImage('/categories/'+category.image)"
              class="white--text"
            >
              <v-card-title 
                class="fill-height align-end"
                v-text="category.name"
              ></v-card-title>
            </v-img>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>

    <v-container class="ma-0 pa-0 mt-2" grid-list-sm>
      <div class="text-right">
        <v-btn small text to="/destinations" class="blue--text">
          All Destinations <v-icon>mdi-chevron-right</v-icon>
        </v-btn>
      </div> 
      <v-layout wrap>
        <v-flex v-for="(destination) in destinations" :key="`destination-`+destination.id" xs6>
          <destination-item :destination="destination" />
        </v-flex>
      </v-layout>
    </v-container>
  </div>
</template>

<script>
export default {
  components: {
    DestinationItem: () => import(/* webpackChunkName: "destination-item" */ '@/components/DestinationItem.vue')
  },
  data: () => ({
    categories: [],
    destinations: []
  }),
  created(){
    this.axios.get('/categories/random/2')
      .then((response) => {
          let { data } = response.data
          this.categories = data
      })
      .catch((error) => {
          let { responses } = error
          console.log(responses)
      })
    
    this.axios.get('/destinations/top/4')
      .then((response) => {
          let { data } = response.data
          this.destinations = data
      })
      .catch((error) => {
          let { responses } = error
          console.log(responses)
      })
  }
};
</script>
