<template>
    <v-card>
        <v-toolbar dark color="primary">
            <v-btn icon dark @click.native="close">
                <v-icon>mdi-close</v-icon>
            </v-btn>
            <v-text-field
                hide-details
                append-icon="mdi-microphone"
                flat
                autofocus
                label="I wanna go to"
                prepend-inner-icon="mdi-magnify"
                v-model="keyword"
                @input="doSearch"
            ></v-text-field>
        </v-toolbar>
        <v-card-text>
            <v-subheader v-if="keyword.length>0">
                Result search "{{ keyword }}"
            </v-subheader>

            <v-alert 
                :value="destinations.length==0 && keyword.length>0"
                color="warning"
            >
                Sorry, but no results were found.
            </v-alert>

            <!-- Hasil pencarian ditampilkan di sini -->
            <v-container class="ma-0 pa-0" grid-list-sm>
            <v-layout wrap>
                <v-flex v-for="(destination) in destinations" :key="`destination-`+destination.id" xs6>
                <destination-item :destination="destination" />
                </v-flex>
            </v-layout>
            </v-container>
        </v-card-text>
    </v-card>
</template>
<script>
export default {
    name: 'search',
    components: {
        DestinationItem: () => import(/* webpackChunkName: "destination-item" */ '@/components/DestinationItem.vue')
    },
    data () {
        return {
            keyword: '',
            destinations: []
        }
    },
    methods: {
        doSearch(){
            let keyword = this.keyword
            if(keyword.length>0){
                this.axios.get('/destinations/search/'+keyword)
                .then((response) => {
                    let { data } = response.data
                    this.destinations = data
                })
                .catch((error) => {
                    console.log(error)
                })
            } else {
                this.destinations = []
            }
        },
        close() {
            this.$emit('closed', false)
        }
    },
    
}
</script>