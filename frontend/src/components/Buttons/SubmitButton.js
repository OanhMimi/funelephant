import './submitButton.css'

function SubmitButton({field}) {

  return (
   <input type="submit" value={field} />
  )
}

export default SubmitButton;