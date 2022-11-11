import "./styles/secondary-button-style.css"

/**
 * 
 * @param {{text: string, action: Delegate}} props 
 * @returns 
 */

export default function SecondaryButton(props) {
    return (
        <button className="secondary-button" onClick={props.action}>
            {props.text}
        </button>
    );
}