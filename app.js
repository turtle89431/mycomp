import React from "react";
import ReactDOM from "react-dom";
import {App} from "./reactComp"
class Holder extends React.Component {
 
  render() {
    return <App name={this.props.name} time={this.props.state.time} />;
  }
}


var mountNode = document.getElementById("app");
ReactDOM.render(<Holder name="Walter" state={{time:"no time"}}/>, mountNode);
let i=0
setInterval(()=>{
  ReactDOM.render(<Holder name="Walter" state={{time:`${i++}`}}/>, mountNode);
},1000)