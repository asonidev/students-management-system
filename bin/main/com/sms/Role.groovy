package com.sms

class Role {
    String authority

    static constraints = {
        authority blank: false, nullable: false, unique: true
    }

    static mapping = {
        cache true
    }

    String toString() {
        authority
    }
}
