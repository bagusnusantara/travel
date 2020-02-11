<template>
  <div>
    <v-container class="ma-0 pa-0" grid-list-sm>
      <v-subheader>
        All destinations 
      </v-subheader>
      <v-layout wrap>
        <v-flex v-for="(destination) in destinations" :key="`destination-`+destination.id" xs6>
          <destination-item :destination="destination" />
        </v-flex>
      </v-layout>
    </v-container>

    <template>
      <div class="text-center">
        <v-pagination
          v-model="page"
          @input="go"
          :length="lengthPage"
          :total-visible="5"
        ></v-pagination>
      </div>
    </template>
  </div>
</template>
<script>
export default {
  components: {
    DestinationItem: () => import(/* webpackChunkName: "destination-item" */ '@/components/DestinationItem.vue')
  },
  data: () => ({
    destinations: [],
    page: 0,
    lengthPage: 0
  }),
  created(){
    this.go()
  },
  methods: {
      go(){
        let url = '/destinations?page='+this.page
        this.axios.get(url)
        .then((response) => {
            let { data } = response.data
            let { meta } = response.data
            this.destinations = data
            // jumlah halaman di dapat dari meta endpoint destinations
            this.lengthPage = meta.last_page 
            this.page = meta.current_page
        })
        .catch((error) => {
            let { responses } = error
            console.log(responses)
        }) 
      }
  }
};
</script>
