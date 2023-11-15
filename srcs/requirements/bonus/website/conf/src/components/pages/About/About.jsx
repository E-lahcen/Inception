import React from "react";
import Skills from "./Skills/Skills";

const About = () => {
  return (
    <section className="py-8">
      <div className="flex flex-wrap md:px-4">
        <div className="w-full">
          <div className="md:mx-4">
            <h3 className="text-2xl text-gray-800 font-bold mb-4">Who am I?</h3>
            <p className="text-sm text-gray-400 leading-6 mb-3">
            I've been learning to code for 3 years, after completing my academic career. I started my journey with 1337 to take the deepest dive ever in the IT world. And now : Software Development Student Seeking Full-time Software Engineer | Graduation 2024
            </p>
          </div>
          <Skills />
        </div>
      </div>
    </section>
  );
};

export default About;
