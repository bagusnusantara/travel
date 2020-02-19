<template>
  <div>
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
