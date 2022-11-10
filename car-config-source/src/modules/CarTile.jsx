import '../styles/CarTile.css';
import PrimaryButton from '../react-assets/primary-button';
import SecondaryButton from '../react-assets/secondary-button';

/**
 * 
 * @param {{id: int, name: string, href: string, imgsrc: string, imgalt: string, price: number}} props 
 * @returns 
 */

export default function CarTile(props) {
    return (
        <div className='car-tile'>
            <header>
                <span>{props.name}</span>
            </header>
            <section>
                <img src={props.imgsrc} alt={props.imgalt} className='car-tile-image'/>
            </section>
            <footer>
                <span> {Math.round(props.price).toLocaleString()} PLN </span>
            </footer>
            <nav>
                <PrimaryButton text='Config' action={() => {window.location.href = props.href}}/>
                <SecondaryButton text='About'/>
            </nav>
        </div>
    );
}