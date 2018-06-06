# Welcome!
Casual Pathway Ontology (CPO) is an application ontology about mechanisms that participate in behavior change interventions. CPO is deliberately small to make it easier to manage and currently only imports Basic Formal Ontology (BFO). CPO is part of the knowledge base that is used to tailor performance reports to healthcare professionals.

## Current Ontology Terms and Definitions
The [DICTIONARY](DICTIONARY.md) represents all terms and definitions in the Casual Pathway Ontology that are not the result of imports from other ontologies. In order to ensure interoperability, please read the [OBO Foundry Guidelines](http://obofoundry.org/principles/fp-000-summary.html) before contributing to term development.

## Contributing to Term Development
All contributions to terms in the ontology should be documented in an issue. Examples of contributions are:
1. Requesting a change to a current term.
1. Proposing a new term.
1. Requesting removal of a current term.

### Requesting a Change or Removal
1. Create a new issue for the change with a descriptive title.
1. Assign the label 'term' to the issue, along with any other labels necessary.
1. Provide a clear description regarding the change that should be addressed.
1. Provide a reference for the change.
1. If the change request requires action from someone specific assign the issue to that person.
1. Create the issue.

### Proposing a New Term
1. Check the current dictionary to see if the term already exists.
1. Create a new issue for the new term with a descriptive title, i.e., 'New Term Need: domain problem'
1. Assign the label 'term' to the issue, along with any other labels necessary.
1. Collect required information for a new term in the body of the issue.
    * Term name
    * Definition
    * Comment (rdfs:comment)
    * Reference
1. Create the issue for the new term.

## Development
### Getting Started
1. Clone this repository
1. Download & install Protege
1. `cd` to project directory
1. Open Protege
1. Open cpo ontology
    1. Use File>Open... menu item
    2. Open owl file `cpo.owl` in project directory

### Release & Publish Ontology Version
1. Tag commit with semantic version string e.g. "v0.2.0"
1. Build .owl (rdf-xml) and .obo artifacts.
1. Update OBO Foundry

## License
### Ontology Content
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/">
  <img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" />
</a>

The ontology content is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.

### Source Code
Copyright [2018] [Regents of the University of Michigan]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
