<template>
  <div>
    <v-card v-if="destination.slug">
        <v-img
            :src="getImage('/destinations/'+destination.cover)"
            class="white--text"
            height="200px"
        >
            <v-card-title 
                class="fill-height align-end"
                v-text="destination.title">
            </v-card-title>
        </v-img>

        <v-card-text>
            <v-simple-table dense>
                <tbody>
                <tr>
                    <td><v-icon>mdi-google-maps</v-icon> Location</td>
                    <td>Suva</td>
                </tr>
                <tr>
                    <td><v-icon>mdi-ticket</v-icon> Available Tickets</td>
                    <td>{{ destination.stock}}</td>
                </tr>
                <tr>
                    <td><v-icon>mdi-cash</v-icon>  Price</td>
                    <td class="orange--text">{{ destination.price.toLocaleString('id-ID')}} FJ$</td>
                </tr>
                </tbody>
            </v-simple-table>
            <br><h2>Description:</h2> <br>
            {{ destination.description }}
            <br>
            Categories: 
            <v-chip v-for="category in destination.categories" :key="category.id" :to="'/category/'+category.slug" small>
                {{ category.name }}
            </v-chip>
        </v-card-text>
        <v-card-actions>
            <v-btn block color="success" @click="buy" :disabled="destination.stock==0">
                <v-icon>mdi-cart-plus</v-icon> &nbsp;
                Add to cart
            </v-btn>
        </v-card-actions>
    </v-card>
  </div>
</template>
<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  data: () => ({
    destination: {}, // objek destination
  }),
  created(){
    this.go()
  },
  computed: {
    ...mapGetters({
        carts: 'cart/carts',
    })
  },
  methods: {
    ...mapActions({
        addCart: 'cart/add',
        setAlert  : 'alert/set',
    }),
    buy(){
        this.addCart(this.destination)
        //this.$store.dispatch('cart/add', this.destination)
        this.setAlert({
            status : true,
            color  : 'success',
            text  : 'Added to cart',
        })
    },
    go(){
        let { slug } = this.$route.params
        let url = '/destinations/slug/'+slug
        url = url + '?page='+this.page
        url = encodeURI(url)
        this.axios.get(url)
        .then((response) => {
            let { data } = response.data
            this.destination = data
        })
        .catch((error) => {
            let { responses } = error
            console.log(responses)
        }) 
    },
  }
};
</script>
