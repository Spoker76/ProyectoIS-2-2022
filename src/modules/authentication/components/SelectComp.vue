<template>
    <div>
        <label :for="label">{{ label }}</label>
        <select :id="label" name="Elementos" v-model="elSelected">
            <option selected value="Seleccione" disabled>Seleccione</option>
            <option v-for="(el, index) in Elementos" :key="index" :value="el" :name="el">{{ el }}</option>
        </select>
    </div>
</template>

<script>
export default {
    props: {
        Elementos: {
            type: Array,
            required: true
        },
        label: {
            type: String,
            required: true
        },
        isLoading: {
            type: Boolean,
            required: false
        }
    },
    data() {
        return {
            elSelected: 'Seleccione'
        }
    },
    watch: {
        elSelected(value) {
            this.$emit('elSelected', value)
        },
        isLoading(value) {
            if (!value) {
                this.elSelected = 'Seleccione'
            }
        }
    }
}
</script>

<style scoped>
div {
    margin-bottom: 30px;
}
</style>