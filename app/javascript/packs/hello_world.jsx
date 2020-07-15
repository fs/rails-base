import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const HelloWorld = props => (
  <h2>
    Hello, {props.name}!
  </h2>
)

HelloWorld.defaultProps = { name: "World"}

HelloWorld.propTypes = { name: PropTypes.string }

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <HelloWorld name="developer" />, document.getElementById("hello")
  )
})

export default HelloWorld
