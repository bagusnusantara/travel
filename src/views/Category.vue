<template>
  <div>
    <v-card :to="'/category/'+ category.slug" v-if="category.slug">
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

    <v-container class="ma-0 pa-0" grid-list-sm v-if="destinations">
      <v-subheader>
        All Destination
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
    category: {}, // objek category
    destinations: [], // daftar buku pada category tersebut
    page: 0,
    lengthPage: 0
  }),
  created(){
    this.go()
  },
  methods: {
    go(){
    let { slug } = this.$route.params
    let url = '/categories/slug/'+slug
    url = url + '?page='+this.page
    url = encodeURI(url)
    this.axios.get(url)
    .then((response) => {
        let { data } = response.data
        let category = data
        this.category = category
        this.destinations = category.destinations.data
        this.page = category.destinations.current_page
        this.lengthPage = category.destinations.last_page
    })
    .catch((error) => {
        let { responses } = error
        console.log(responses)
    }) 
    }
  }
};
</script>
