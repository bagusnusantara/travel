<template>
  <div>
    <v-card :to="'/destination/'+ destination.slug">
      <v-img
        :src="getImage('/destinations/'+destination.cover)"
        class="white--text"
        height="200px"
      >
        <v-card-title 
          class="fill-height align-end"
          v-text="destination.title"
        ></v-card-title>
      </v-img>

      <v-card-actions>
        <v-icon>mdi-cash</v-icon> 
        <span class="orange--text"> {{ destination.price.toLocaleString('id-ID') }} FJ$ </span>
        <v-spacer></v-spacer>
        <v-icon>mdi-eye</v-icon> {{ destination.views }}
      </v-card-actions>

    </v-card>
  </div>
</template>
<script>
export default {
  name: 'destination-item',
  props: ['destination'],
  data: () => ({
  }),
}
</script>