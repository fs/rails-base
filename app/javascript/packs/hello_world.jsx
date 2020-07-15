import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const HelloWorld = ({ name }) => (
  <h2>
    Hello, 
    {name}
    !
  </h2>
)

HelloWorld.defaultProps = { name: "World"}

HelloWorld.propTypes = { name: PropTypes.string }

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <HelloWorld />, document.getElementById("hello")
  )
})

export default HelloWorld
