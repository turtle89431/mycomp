import React, { Component } from 'react'

export default class App extends Component {
    constructor(props){
        super(props)
        this.name = this.props.name
    }
    render() {
        return (
            <div>
                react test from {this.name} at {this.props.time}
            </div>
        )
    }
}
