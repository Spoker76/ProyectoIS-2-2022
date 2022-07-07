<template>
    <div>
        <label :for="label">{{ label }}</label>
        <input :id="label" :type="type" :placeholder="label" v-model="inputValue" required>
        <span v-if="!isValid">{{ msg
        }}</span>
    </div>
</template>

<script>
export default {
    props: {
        label: {
            type: String,
            required: true
        },
        type: {
            type: String,
            required: true,
            default: 'text'
        },
        isLoading: {
            type: Boolean,
            required: true
        }
    },
    data() {
        return {
            inputValue: '',
            isValid: false,
            msg: ''
        }
    },
    methods: {
        validateEmail(email) {
            /*eslint-disable */
            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email) || email.length === 0) {
                this.isValid = true
                this.msg = 'Valid'
            } else {
                this.msg = 'Invalid'
                this.isValid = false
            }
            /*eslint-disable */
        },
        validatePhoneNumber(phoneNumber) {
            if (/^\d{4}-\d{4}$/.test(phoneNumber) || phoneNumber.length === 0) {
                this.isValid = true
                this.msg = 'Valid'
            } else {
                this.isValid = false
                this.msg = 'Invalid'
            }
        }
    },
    watch: {
        inputValue(value) {

            if (this.type === 'email') {
                this.validateEmail(value)
            } else if (this.type === 'tel') {
                this.validatePhoneNumber(value)
            }
            this.$emit('inputValue', value, this.isValid)
        },
        isLoading(value) {
            if (!value) {
                this.inputValue = ''
            }
        }
    }
}
</script>

<style scoped>
span {
    margin: 0 auto;
    text-align: left;
    font-size: 12px;
    display: block;
    width: 15%;
    color: red;
}


div {
    margin-bottom: 30px;
}
</style>